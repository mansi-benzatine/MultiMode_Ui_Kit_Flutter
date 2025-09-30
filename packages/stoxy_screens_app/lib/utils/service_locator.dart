// Service locator (context without)
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stoxy_screens_app_package/utils/preference.dart';

final getIt = GetIt.instance;

Future<void> initializeDependenciesStoxyScreensApp() async {
  final preferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<LocalStorageService>(() => LocalStorageService(preferences));
}
