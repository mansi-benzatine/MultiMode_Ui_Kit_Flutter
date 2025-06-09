import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../localization/locale_constant.dart';
import '../../localization/localizations_delegate.dart';
import '../../themes/app_themes.dart';
import '../../themes/theme_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/preference.dart';
import '../../utils/service_locator.dart';
import '../screens_list/view/screens_list_screen.dart';

class GoozzyECommerceScreensMyApp extends StatefulWidget {
  final ThemeData? externalThemeData;
  static final navigatorKey = GlobalKey<NavigatorState>();

  const GoozzyECommerceScreensMyApp({super.key, this.externalThemeData});
  static void setLocale(BuildContext context, Locale newLocale) {
    _GoozzyECommerceScreensMyAppState? state = context.findAncestorStateOfType<_GoozzyECommerceScreensMyAppState>();
    state?.setLocale(newLocale);
  }

  /*static void changeStatusBar(BuildContext context, bool isLightTheme, {bool isLightBgTheme = false}) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.changeTheme(isLightTheme, isLightBgTheme: isLightBgTheme);
  }*/

  static void changeTheme(BuildContext context, ThemeData themeData) {
    _GoozzyECommerceScreensMyAppState? state = context.findAncestorStateOfType<_GoozzyECommerceScreensMyAppState>();
    state?.changeTheme(themeData);
  }

  @override
  State<GoozzyECommerceScreensMyApp> createState() => _GoozzyECommerceScreensMyAppState();
}

class _GoozzyECommerceScreensMyAppState extends State<GoozzyECommerceScreensMyApp> {
  Locale? _locale;
  // bool _isLightTheme = true;
  // bool _isLightBgTheme = false;
  ThemeData? _themeData;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    _themeData = widget.externalThemeData ?? ThemeData.light();
    _updateLocalStorageFromTheme(_themeData!);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ThemeData theme = AppTheme.getTheme(context);

      if (mounted) {
        setState(() {
          _themeData = theme;
          AppAssets.refreshAssets();
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
      AppAssets.refreshAssets();
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
        AppAssets.refreshAssets();
      });
    } else if (widget.externalThemeData != null && widget.externalThemeData != _themeData) {
      setState(() {
        _themeData = widget.externalThemeData;
        AppAssets.refreshAssets();
      });
    }
    if (!isInitialized) {
      getLocale().then((locale) {
        if (mounted) {
          setState(() {
            _locale = locale;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) {
        return MaterialApp(
          navigatorKey: GoozzyECommerceScreensMyApp.navigatorKey,
          debugShowCheckedModeBanner: false,
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
          home: GoozzyECommerceScreenListScreen(
            title: 'Goozzy E Commerce App',
            onBack: () {
              Navigator.pop(context);
            },
          ),
          /* home: isFirstTime
              ? const OnboardingScreen()
              : isWelcomeDone
                  ? const HomeScreen()
                  : const WelcomeScreen(),*/
        );
      },
    );
  }
}

class GoozzyECommerceScreensList extends StatelessWidget {
  final ThemeData themeData;
  const GoozzyECommerceScreensList({super.key, required this.themeData});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          final navigator = GoozzyECommerceScreensMyApp.navigatorKey.currentState;
          if (navigator != null && navigator.canPop()) {
            navigator.pop();
          } else {
            Navigator.pop(context);
          }
        },
        child: GoozzyECommerceScreensMyApp(externalThemeData: themeData),
      ),
    );
  }
}
