import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/screens_list/views/screens_list_screen.dart';

import '../../localization/localizations_delegate.dart';
import '../../themes/theme_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/preference.dart';
import '../../utils/service_locator.dart';

class RunTrackerStepCounterWaterReminderScreensApp extends StatefulWidget {
  final ThemeData? externalThemeData;
  static final navigatorKey = GlobalKey<NavigatorState>();

  static void setLocale(BuildContext context, Locale newLocale) {
    _RunTrackerStepCounterWaterReminderScreensAppState? state = context
        .findAncestorStateOfType<
          _RunTrackerStepCounterWaterReminderScreensAppState
        >();
    state?.setLocale(newLocale);
  }

  static void changeTheme(BuildContext context, ThemeData themeData) {
    _RunTrackerStepCounterWaterReminderScreensAppState? state = context
        .findAncestorStateOfType<
          _RunTrackerStepCounterWaterReminderScreensAppState
        >();
    state?.changeTheme(themeData);
  }

  const RunTrackerStepCounterWaterReminderScreensApp({
    super.key,
    this.externalThemeData,
  });

  @override
  State<RunTrackerStepCounterWaterReminderScreensApp> createState() =>
      _RunTrackerStepCounterWaterReminderScreensAppState();
}

class _RunTrackerStepCounterWaterReminderScreensAppState
    extends State<RunTrackerStepCounterWaterReminderScreensApp> {
  Locale? _locale;
  ThemeData? _themeData;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Initialize with stored theme or default to light
    final isLightTheme = getIt.get<LocalStorageService>().getBool(
      LocalStorageService.isLightTheme,
      optionalValue: true,
    );
    _themeData = isLightTheme ? ThemeData.light() : ThemeData.dark();

    // Override with externalThemeData if provided
    if (widget.externalThemeData != null) {
      _themeData = widget.externalThemeData!;
    }

    // Update local storage with initial theme
    _updateLocalStorageFromTheme(_themeData!);

    // Refresh assets after theme is set
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        AppAssets.refreshAssets(context);
      });
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
    getIt.get<LocalStorageService>().setBool(
      LocalStorageService.isLightTheme,
      isLightTheme,
    );
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
    } else if (widget.externalThemeData != null &&
        widget.externalThemeData != _themeData) {
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
        return MaterialApp(
          navigatorKey:
              RunTrackerStepCounterWaterReminderScreensApp.navigatorKey,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: _themeData,
          supportedLocales: const [Locale('en', '')],
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: _locale,
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          home: ScreenListScreen(
            title: "Tracker Mode App",
            onBack: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}

class RunTrackerStepCounterWaterReminderScreensAppWrapper
    extends StatelessWidget {
  final ThemeData? themeData;
  const RunTrackerStepCounterWaterReminderScreensAppWrapper({
    super.key,
    this.themeData,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData ?? ThemeData.light(),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          final navigator = RunTrackerStepCounterWaterReminderScreensApp
              .navigatorKey
              .currentState;
          if (navigator != null && navigator.canPop()) {
            navigator.pop();
          } else {
            Navigator.pop(context);
          }
        },
        child: RunTrackerStepCounterWaterReminderScreensApp(
          externalThemeData: themeData,
        ),
      ),
    );
  }
}
