import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_finder_app_package_for_main/utils/preference.dart';
import 'package:job_finder_app_package_for_main/utils/service_locator.dart';

import '../../localization/localizations_delegate.dart';
import '../../themes/app_theme.dart';
import '../../themes/theme_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/utils.dart';
import '../welcome/view/welcome_screen.dart';

class JobFinderAppForMain extends StatefulWidget {
  final ThemeData? externalThemeData;
  static final navigatorKey = GlobalKey<NavigatorState>();

  static void setLocale(BuildContext context, Locale newLocale) {
    _JobFinderAppForMainState? state = context.findAncestorStateOfType<_JobFinderAppForMainState>();
    state?.setLocale(newLocale);
  }

  static void changeTheme(BuildContext context, ThemeData themeData) {
    _JobFinderAppForMainState? state = context.findAncestorStateOfType<_JobFinderAppForMainState>();
    state?.changeTheme(themeData);
  }

  const JobFinderAppForMain({super.key, this.externalThemeData});

  @override
  State<JobFinderAppForMain> createState() => _JobFinderAppForMainState();
}

class _JobFinderAppForMainState extends State<JobFinderAppForMain> {
  Locale? locale;
  ThemeData? _themeData;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    _themeData = widget.externalThemeData ?? ThemeData.light();
    _updateLocalStorageFromTheme(_themeData!);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ThemeData theme = AppTheme.getTheme(context);
      /* final isLight = getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true);
      final ThemeData theme = isLight ? ThemeData.light() : ThemeData.dark();*/
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
      locale = locale;
    });
  }

  void changeTheme(ThemeData themeData) {
    setState(() {
      AppAssets.refreshAssets(context);
      _themeData = themeData;
    });
    _updateLocalStorageFromTheme(themeData);
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
            statusBarIconBrightness: Utils.isLightTheme() ? Brightness.dark : Brightness.light,
            statusBarBrightness: Utils.isLightTheme() ? Brightness.dark : Brightness.light,
            statusBarColor: CustomAppColor.of(context).transparent,
          ),
          child: MaterialApp(
            navigatorKey: JobFinderAppForMain.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: _themeData,
            themeMode: ThemeMode.system,
            supportedLocales: const [
              Locale('en', ''),
            ],
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: locale,
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            home: const JobFinderWelcomeScreen(),
            /* home: isFirstTime
                ? const OnboardingScreen()
                : isWelcomeDone
                    ? const HomeScreen()
                    : const WelcomeScreen(),*/
          ),
        );
      },
    );
  }
}

class JobFinderWrapper extends StatelessWidget {
  final ThemeData themeData;
  const JobFinderWrapper({super.key, required this.themeData});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          final navigator = JobFinderAppForMain.navigatorKey.currentState;
          if (navigator != null && navigator.canPop()) {
            navigator.pop();
          } else {
            Navigator.pop(context);
          }
        },
        child: JobFinderAppForMain(externalThemeData: themeData),
      ),
    );
  }
}
