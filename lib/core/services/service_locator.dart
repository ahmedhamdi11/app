import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Initialize shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Register shared preferences
  getIt.registerSingleton<SharedPreferences>(prefs);
}
