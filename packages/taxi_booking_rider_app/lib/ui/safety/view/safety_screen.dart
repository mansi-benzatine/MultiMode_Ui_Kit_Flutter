import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_rider_app_package/localization/language/languages.dart';
import 'package:taxi_booking_rider_app_package/utils/app_color.dart';
import 'package:taxi_booking_rider_app_package/utils/constant.dart';
import 'package:taxi_booking_rider_app_package/widgets/top_bar/topbar.dart';

class SafetyScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SafetyScreen());
  }

  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen>
    implements TopBarClickListener {
  final String _dummyText = '''
An nec aliquam dissentias quaerendum, in ubique molestie recteque eum, ei justo iusto signiferumque mea. Nam modo hinc quas eu, an ubique tamquam officiis nam. At has doming epicurei reprehendunt, vidisse nominavi his in, exerci detracto pertinax sed eu. Qui laboramus deterruisset id, id nec dicat noluisse invenire, ut sonet primis percipit sed. Per in petentium abhorreant, iudico quodsi deterruisset eum ne. Decore sensibus sed ex. Iisque lobortis nec ne. Blandit sapientem vix ne, primis urbanitas efficiantur mea ne. Te legere tamquam ius. Ut suas populo evertitur quo, in vis meis iudico sapientem.\n
Iisque lobortis nec ne. Blandit sapientem vix ne, primis urbanitas efficiantur mea ne. Te legere tamquam ius. Ut suas populo evertitur quo, in vis meis iudico sapientem. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n
Ex mazim tractatos consequat mea, sententiae ullamcorper voluptatibus eu sed, duo debitis facilisi interesset id. Iudico graece iriure mel id, melius sanctus an pro, consul pericula dissentiet est cu. Falli quaerendum id mea, cum te etiam qualisque temporibus, pro eu clita veritus. Ei has nonumy efficiantur, diam invidunt lucilius eu pri. Vis eirmod audiam maiorum ne, pertinax adipiscing voluptatibus eu has, vis eu vivendo propriae.
''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(this, title: Languages.of(context).txtPrivacyPolicy),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(
                _dummyText,
                style: TextStyle(
                  color: CustomAppColor.of(context).txtGray,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
