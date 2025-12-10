// Service locator (context without)
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'preference.dart';

final getIt = GetIt.instance;

Future<void> initializeDependenciesGroKitScreensApp() async {
  final preferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<LocalStorageService>(() => LocalStorageService(preferences));
}
