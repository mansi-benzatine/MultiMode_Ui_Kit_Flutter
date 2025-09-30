import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../utils/sizer_utils.dart';
import 'otp_field_style.dart';

class OTPTextField extends StatefulWidget {
  /// Number of the OTP Fields
  final int length;

  /// Total Width of the OTP Text Field
  final double width;

  /// Width of the single OTP Field
  final double fieldWidth;

  /// Height of the single OTP Field
  final double fieldHeight;

  /// margin around the text fields
  final EdgeInsetsGeometry margin;

  /// Manage the type of keyboard that shows up
  final TextInputType keyboardType;

  /// The style to use for the text being edited.
  final TextStyle style;

  /// The style to use for the text being edited.
  final double outlineBorderRadius;

  /// Text Field Alignment
  /// default: MainAxisAlignment.spaceBetween [MainAxisAlignment]
  final MainAxisAlignment textFieldAlignment;

  /// Obscure Text if data is sensitive
  final bool obscureText;

  /// Text Field Style
  final OtpFieldStyle? otpFieldStyle;

  /// Text Field Style for field shape.
  /// default FieldStyle.underline [FieldStyle]
  final FieldStyle fieldStyle;

  /// Callback function, called when a change is detected to the pin.
  final ValueChanged<String>? onChanged;

  /// Callback function, called when pin is completed.
  final ValueChanged<String>? onCompleted;

  final BuildContext context;

  const OTPTextField(
      {super.key,
      this.length = 4,
      this.width = 10,
      this.fieldHeight = 30,
      this.fieldWidth = 30,
      this.margin = const EdgeInsets.symmetric(horizontal: 3),
      this.otpFieldStyle,
      this.keyboardType = TextInputType.number,
      this.style = const TextStyle(),
      this.outlineBorderRadius = 10,
      this.textFieldAlignment = MainAxisAlignment.spaceBetween,
      this.obscureText = false,
      this.fieldStyle = FieldStyle.underline,
      this.onChanged,
      required this.context,
      this.onCompleted})
      : assert(length > 1);

  @override
  State<OTPTextField> createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  late OtpFieldStyle _otpFieldStyle;
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;
  late List<ValueNotifier<bool>?> _isFilled;

  late List<Widget> _textFields;
  late List<String> _pin;

  @override
  void initState() {
    if (widget.otpFieldStyle == null) {
      _otpFieldStyle = OtpFieldStyle();
    } else {
      _otpFieldStyle = widget.otpFieldStyle!;
    }

    super.initState();

    _focusNodes = List<FocusNode?>.filled(widget.length, null, growable: false);
    _textControllers = List<TextEditingController?>.filled(widget.length, null, growable: false);
    _textControllers = List.generate(
      widget.length,
      (index) => TextEditingController(text: "2"),
      growable: false,
    );
    _isFilled = List<ValueNotifier<bool>?>.filled(widget.length, null, growable: false);
    _pin = List.generate(widget.length, (int i) {
      return '';
    });
    _textFields = List.generate(widget.length, (int i) {
      return buildTextField(widget.context, i);
    });
  }

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        mainAxisAlignment: widget.textFieldAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _textFields,
      ),
    );
  }

  /// This function Build and returns individual TextField item.
  ///
  /// * Requires a build context
  /// * Requires Int position of the field
  Widget buildTextField(BuildContext context, int i) {
    if (_focusNodes[i] == null) _focusNodes[i] = FocusNode();

    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
    }
    if (_isFilled[i] == null) {
      _isFilled[i] = ValueNotifier(false);
    }

    return ValueListenableBuilder(
      valueListenable: _isFilled[i]!,
      builder: (context, value, child) {
        return Container(
          width: widget.fieldWidth,
          height: widget.fieldHeight,
          margin: widget.margin,
          decoration: BoxDecoration(color: _otpFieldStyle.backgroundColor, borderRadius: BorderRadius.circular(widget.outlineBorderRadius)),
          alignment: Alignment.center,
          child: TextField(
            controller: _textControllers[i],
            keyboardType: widget.keyboardType,
            textAlign: TextAlign.center,
            style: widget.style,
            focusNode: _focusNodes[i],
            obscureText: widget.obscureText,
            cursorColor: CustomAppColor.of(context).primary,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.symmetric(vertical: 40.setHeight, horizontal: 5.setWidth),
              border: _isFilled[i]!.value ? _getBorder(_otpFieldStyle.filledBorderColor) : _getBorder(_otpFieldStyle.borderColor),
              focusedBorder: _isFilled[i]!.value ? _getBorder(_otpFieldStyle.filledBorderColor) : _getBorder(_otpFieldStyle.borderColor),
              enabledBorder: _isFilled[i]!.value ? _getBorder(_otpFieldStyle.filledBorderColor) : _getBorder(_otpFieldStyle.enabledBorderColor),
              disabledBorder: _isFilled[i]!.value ? _getBorder(_otpFieldStyle.filledBorderColor) : _getBorder(_otpFieldStyle.disabledBorderColor),
              errorBorder: _getBorder(_otpFieldStyle.errorBorderColor),
            ),
            onChanged: (String str) {
              if (str.length > 1) {
                _handlePaste(str);
                return;
              }

              // Check if the current value at this position is empty
              // If it is move focus to previous text field.
              if (str.isEmpty) {
                if (i == 0) return;
                _focusNodes[i]!.unfocus();
                _focusNodes[i - 1]!.requestFocus();
              }

              // Update the current pin
              setState(() {
                _pin[i] = str;
                _isFilled[i]!.value = str.isNotEmpty;
              });

              // Remove focus
              if (str.isNotEmpty) _focusNodes[i]!.unfocus();
              // Set focus to the next field if available
              if (i + 1 != widget.length && str.isNotEmpty) {
                FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
              }

              String currentPin = _getCurrentPin();

              // if there are no null values that means otp is completed
              // Call the `onCompleted` callback function provided
              if (!_pin.contains(null) && !_pin.contains('') && currentPin.length == widget.length) {
                widget.onCompleted!(currentPin);
              }

              widget.onChanged!(currentPin);
            },
          ),
        );
      },
    );
  }

  InputBorder _getBorder(Color color) {
    return widget.fieldStyle == FieldStyle.box
        ? OutlineInputBorder(borderSide: BorderSide(color: color, width: 1.5), borderRadius: BorderRadius.circular(widget.outlineBorderRadius))
        : UnderlineInputBorder(borderSide: BorderSide(color: color, width: 2.5));
  }

  String _getCurrentPin() {
    String currentPin = "";
    for (var value in _pin) {
      currentPin += value;
    }
    return currentPin;
  }

  void _handlePaste(String str) {
    if (str.length > widget.length) {
      str = str.substring(0, widget.length);
    }

    for (int i = 0; i < str.length; i++) {
      String digit = str.substring(i, i + 1);
      _textControllers[i]!.text = digit;
      _pin[i] = digit;
    }

    FocusScope.of(context).requestFocus(_focusNodes[widget.length - 1]);

    String currentPin = _getCurrentPin();

    // if there are no null values that means otp is completed
    // Call the `onCompleted` callback function provided
    if (!_pin.contains(null) && !_pin.contains('') && currentPin.length == widget.length) {
      widget.onCompleted!(currentPin);
    }

    // Call the `onChanged` callback function
    widget.onChanged!(currentPin);
  }
}
