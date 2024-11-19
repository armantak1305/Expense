import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark=false;
  void prefGetValue()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    _isDark =  pref.getBool("ThemeKey")??false;
    notifyListeners();
  }
  void changeThemeValue(bool newValue)async{
    _isDark=newValue;
    SharedPreferences pref =await SharedPreferences.getInstance();
    pref.setBool("ThemeKey", newValue);
    notifyListeners();
  }
  getThemeValue()=>_isDark;

}