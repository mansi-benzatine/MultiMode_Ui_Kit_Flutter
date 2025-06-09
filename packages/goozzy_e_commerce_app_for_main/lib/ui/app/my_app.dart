import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../localization/locale_constant.dart';
import '../../localization/localizations_delegate.dart';
import '../../themes/app_themes.dart';
import '../../themes/theme_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/preference.dart';
import '../../utils/service_locator.dart';
import '../../utils/utils.dart';
import '../on_boarding/view/on_boarding_screen.dart';

class GoozzyECommerceMyApp extends StatefulWidget {
  final ThemeData? externalThemeData;
  static final navigatorKey = GlobalKey<NavigatorState>();

  const GoozzyECommerceMyApp({super.key, this.externalThemeData});
  static void setLocale(BuildContext context, Locale newLocale) {
    _GoozzyECommerceMyAppState? state = context.findAncestorStateOfType<_GoozzyECommerceMyAppState>();
    state?.setLocale(newLocale);
  }

  static void changeTheme(BuildContext context, ThemeData themeData) {
    _GoozzyECommerceMyAppState? state = context.findAncestorStateOfType<_GoozzyECommerceMyAppState>();
    state?.changeTheme(themeData);
  }

  @override
  State<GoozzyECommerceMyApp> createState() => _GoozzyECommerceMyAppState();
}

class _GoozzyECommerceMyAppState extends State<GoozzyECommerceMyApp> {
  Locale? _locale;
  ThemeData? _themeData;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Initialize with externalThemeData or fallback

    _themeData = widget.externalThemeData ?? ThemeData.light();
    // Load theme asynchronously after frame
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
    // bool isFirstTime = getIt.get<LocalStorageService>().getBool(LocalStorageService.isFirstTime, optionalValue: true);
    // bool isWelcomeDone = getIt.get<LocalStorageService>().getBool(LocalStorageService.isWelcomeDone, optionalValue: false);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: Utils.isLightTheme() ? Brightness.dark : Brightness.light, // Android
            statusBarBrightness: Utils.isLightTheme() ? Brightness.dark : Brightness.light, // iOS
            statusBarColor: CustomAppColor.of(context).transparent,
          ),
          child: MaterialApp(
              themeMode: ThemeMode.system,
              navigatorKey: GoozzyECommerceMyApp.navigatorKey,
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
              home: const OnBoardingScreen()),
        );
      },
    );
  }
}

class GoozzyECommerceAppWrapper extends StatelessWidget {
  final ThemeData themeData;

  const GoozzyECommerceAppWrapper({super.key, required this.themeData});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          final navigator = GoozzyECommerceMyApp.navigatorKey.currentState;
          if (navigator != null && navigator.canPop()) {
            navigator.pop();
          } else {
            Navigator.pop(context);
          }
        },
        child: GoozzyECommerceMyApp(
          externalThemeData: themeData,
        ),
      ),
    );
  }
}
