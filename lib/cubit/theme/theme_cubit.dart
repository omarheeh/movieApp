import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool _darkTheme = false;
  String THEME_STATUS = 'THEME_STATUS';
  bool get GetIsDarkTheme => _darkTheme;

  Future<void> setDarkTheme({required bool themeValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, themeValue);
    _darkTheme = themeValue;
    if (_darkTheme) {
      emit(ThemeDark());
    } else {
      emit(ThemeLight());
    }
  }

  Future<void> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _darkTheme = prefs.getBool(THEME_STATUS) ?? false;
    if (_darkTheme) {
      emit(ThemeDark());
    } else {
      emit(ThemeLight());
    }
  }
}
