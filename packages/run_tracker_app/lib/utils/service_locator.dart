// Service locator (context without)
import 'package:get_it/get_it.dart';
import 'package:run_tracker_app/utils/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeDependenciesRunTrackerApp() async {
  final preferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<LocalStorageService>(
    () => LocalStorageService(preferences),
  );
}
