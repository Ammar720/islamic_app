
import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences sharedPreferences;

  static initializeCache() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setMode({required bool value }) {
    sharedPreferences.setBool('themeMode', value);
  }

  static bool getMode() {
   bool isDark = sharedPreferences.getBool('themeMode') ?? false;
   return isDark ;
  }
  static setlanguage({required String value }) {
    sharedPreferences.setString('language', value);
  }

  static String getlanguage(String s) {
   return sharedPreferences.getString('language') ?? 'en';
  }
}
