// packages/job_finder_app/lib/service_locator.dart

import 'package:get_it/get_it.dart';
import 'package:job_finder_app_package_for_main/utils/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeDependenciesJobFinderAppForMain() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<LocalStorageService>(() => LocalStorageService(prefs));
}
