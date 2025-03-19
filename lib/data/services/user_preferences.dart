import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? preferences;
  static String KEY_USER_ID = "user_id";
  static String KEY_USER_USERNAME = "user_username";
  static String KEY_USER_FRIENDS = "user_friends";
  static String KEY_USER_SHOWCASE = "user_showcase";
  static String KEY_USER_PACKS = "user_packs";
  static String KEY_USER_CARDS = "user_cards";

  static void initSharedPreference() async {
    preferences = await SharedPreferences.getInstance();

  }

  static String? getPref(String preferenceKey) {
    return preferences?.getString(preferenceKey);
  }

  static void setPref(String preferenceKey, String value) {
    preferences?.setString(preferenceKey, value);
  }
}