import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_counter_screens_app_package/ui/screens_list/view/screens_list_screen.dart';

import '../../localization/localizations_delegate.dart';
import '../../themes/app_theme.dart';
import '../../themes/theme_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/preference.dart';
import '../../utils/service_locator.dart';
import '../../utils/utils.dart';

class StepCounterScreensApp extends StatefulWidget {
  final ThemeData? externalThemeData;
  static final navigatorKey = GlobalKey<NavigatorState>();

  static void setLocale(BuildContext context, Locale newLocale) {
    _StepCounterScreensAppState? state = context.findAncestorStateOfType<_StepCounterScreensAppState>();
    state?.setLocale(newLocale);
  }

  static void changeTheme(BuildContext context, ThemeData themeData) {
    _StepCounterScreensAppState? state = context.findAncestorStateOfType<_StepCounterScreensAppState>();
    state?.changeTheme(themeData);
  }

  const StepCounterScreensApp({super.key, this.externalThemeData});

  @override
  State<StepCounterScreensApp> createState() => _StepCounterScreensAppState();
}

class _StepCounterScreensAppState extends State<StepCounterScreensApp> {
  Locale? _locale;
  ThemeData? _themeData;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    final isLightTheme = getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true);
    _themeData = isLightTheme ? ThemeData.light() : ThemeData.dark();
    _updateLocalStorageFromTheme(_themeData!);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ThemeData theme = AppTheme.getTheme(context);
      if (mounted) {
        setState(() {
          _themeData = theme;
          AppAssets.refreshAssets(context);
        });
      }
    });
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void changeTheme(ThemeData themeData) {
    setState(() {
      AppAssets.refreshAssets(context);
      _themeData = themeData;
    });
    _updateLocalStorageFromTheme(_themeData!);
    final themeProvider = ThemeProvider.of(context);
    if (themeProvider != null) {
      themeProvider.onThemeChanged(themeData);
    }
  }

  void _updateLocalStorageFromTheme(ThemeData themeData) {
    final isLightTheme = themeData.brightness == Brightness.light;
    getIt.get<LocalStorageService>().setBool(LocalStorageService.isLightTheme, isLightTheme);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final themeProvider = ThemeProvider.of(context);
    if (themeProvider != null && themeProvider.themeData != _themeData) {
      setState(() {
        _themeData = themeProvider.themeData;
        AppAssets.refreshAssets(context);
      });
    } else if (widget.externalThemeData != null && widget.externalThemeData != _themeData) {
      setState(() {
        _themeData = widget.externalThemeData;
        AppAssets.refreshAssets(context);
      });
    }
    if (!isInitialized) {
      /*getLocale().then((locale) {
        if (mounted) {
          setState(() {
            locale = locale;
          });
        }
      });*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: Utils.isLightTheme() ? Brightness.dark : Brightness.light, // Android
            statusBarBrightness: Utils.isLightTheme() ? Brightness.light : Brightness.dark, // iOS
            statusBarColor: CustomAppColor.of(context).transparent,
          ),
          child: MaterialApp(
            navigatorKey: StepCounterScreensApp.navigatorKey,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: _themeData,
            supportedLocales: const [
              Locale('en', ''),
            ],
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: _locale,
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            home: ScreenListScreen(
              title: "Step Mode - Step Counter App",
              onBack: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }
}

class StepCounterScreensAppWrapper extends StatelessWidget {
  final ThemeData themeData;

  const StepCounterScreensAppWrapper({super.key, required this.themeData});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          final navigator = StepCounterScreensApp.navigatorKey.currentState;
          if (navigator != null && navigator.canPop()) {
            navigator.pop();
          } else {
            Navigator.pop(context);
          }
        },
        child: StepCounterScreensApp(externalThemeData: themeData),
      ),
    );
  }
}
