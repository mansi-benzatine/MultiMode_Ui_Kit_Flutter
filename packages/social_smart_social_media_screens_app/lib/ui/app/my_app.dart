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

class SocialSmartSocialMediaScreensApp extends StatefulWidget {
  final ThemeData? externalThemeData;
  static final navigatorKey = GlobalKey<NavigatorState>();

  const SocialSmartSocialMediaScreensApp({super.key, this.externalThemeData});
  static void setLocale(BuildContext context, Locale newLocale) {
    _SocialSmartSocialMediaScreensAppState? state = context.findAncestorStateOfType<_SocialSmartSocialMediaScreensAppState>();
    state?.setLocale(newLocale);
  }

  static void changeTheme(BuildContext context, ThemeData themeData) {
    _SocialSmartSocialMediaScreensAppState? state = context.findAncestorStateOfType<_SocialSmartSocialMediaScreensAppState>();
    state?.changeTheme(themeData);
  }

  @override
  State<SocialSmartSocialMediaScreensApp> createState() => _SocialSmartSocialMediaScreensAppState();
}

class _SocialSmartSocialMediaScreensAppState extends State<SocialSmartSocialMediaScreensApp> {
  Locale? _locale;
  ThemeData? _themeData;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    _themeData = widget.externalThemeData ?? ThemeData.light();
    _updateLocalStorageFromTheme(_themeData!);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final theme = AppTheme.getTheme(context);
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
      _locale = locale;
    });
  }

  void changeTheme(ThemeData themeData) {
    setState(() {
      AppAssets.refreshAssets();
      _themeData = themeData;
    });

    final themeProvider = ThemeProvider.of(context);
    _updateLocalStorageFromTheme(themeData);
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
          navigatorKey: SocialSmartSocialMediaScreensApp.navigatorKey,
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
          home: SocialSmartSocialMediaScreenListScreen(
            title: "Social Media App",
            onBack: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}

class SocialSmartScreensList extends StatelessWidget {
  final ThemeData themeData;
  const SocialSmartScreensList({super.key, required this.themeData});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          final navigator = SocialSmartSocialMediaScreensApp.navigatorKey.currentState;
          if (navigator != null && navigator.canPop()) {
            navigator.pop();
          } else {
            Navigator.pop(context);
          }
        },
        child: SocialSmartSocialMediaScreensApp(externalThemeData: themeData),
      ),
    );
  }
}
