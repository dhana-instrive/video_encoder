
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/theme_manager.dart';

const String PREFS_KEY_THEME = "PREFS_KEY_THEME";

class AppPreferences{

  SharedPreferences sharedPreferences;
  AppPreferences({required this.sharedPreferences});


  Future<void> saveTheme(String theme) async => await sharedPreferences.setString(PREFS_KEY_THEME, theme);

  Future<String> getAppTheme() async{
    String? theme = sharedPreferences.getString(PREFS_KEY_THEME);
    if(theme !=null && theme.isNotEmpty){
      return theme;
    }else{
      return THEME_LIGHT;
    }
  }

}