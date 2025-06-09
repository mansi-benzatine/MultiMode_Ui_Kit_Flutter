// Service locator (context without)
import 'package:chat_ai_app_package/utils/preference.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeDependenciesChatAiApp() async {
  final preferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<LocalStorageService>(() => LocalStorageService(preferences));
}
