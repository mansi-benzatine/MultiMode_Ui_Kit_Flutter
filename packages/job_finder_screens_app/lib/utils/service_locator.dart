import 'package:get_it/get_it.dart';
import 'package:job_finder_screens_app_package/utils/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeDependenciesJobFinderScreensApp() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<LocalStorageService>(() => LocalStorageService(prefs));
}
