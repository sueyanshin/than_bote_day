import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dark_mode_state.dart';

class DarkModeCubit extends Cubit<DarkModeState> {
  bool isDarkMode = false;
  DarkModeCubit() : super(const DarkModeState(isDarkMode: false)) {
    _loadModeFromPref();
  }

  void toggleDarkMode() {
    isDarkMode = !state.isDarkMode;
    _saveModeToPref(isDarkMode);
    emit(DarkModeState(isDarkMode: isDarkMode));
  }

  Future<void> _loadModeFromPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('darkMode') ?? false;
    emit(DarkModeState(isDarkMode: isDarkMode));
  }

  Future<void> _saveModeToPref(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', isDarkMode);
  }
}
