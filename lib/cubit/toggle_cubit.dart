import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'toggle_state.dart';

class ToggleCubit extends Cubit<ToggleState> {
  bool isVisible = true;
  ToggleCubit() : super(const ToggleState(true)) {
    _loadSwitchFromPref();
  }

  void toggleSwitch() {
    bool doSwitch = !state.isSwitched;
    _saveSwitchToPref(doSwitch);
    emit(ToggleState(doSwitch));
  }

  Future<void> _loadSwitchFromPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isVisible = prefs.getBool('switch') ?? false;
    emit(ToggleState(isVisible));
  }

  Future<void> _saveSwitchToPref(bool dos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('switch', dos);
  }
}
