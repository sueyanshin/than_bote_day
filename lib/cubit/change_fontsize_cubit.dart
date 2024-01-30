import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_fontsize_state.dart';

class ChangeFontsizeCubit extends Cubit<double> {
  double fs = 35.0;
  ChangeFontsizeCubit() : super((35.0)) {
    // _loadFontSizeFromPref();
  }

  // void changeFontSize() {
  //   fs = state;
  //   _saveFontSizeToPref(fs);
  //   emit(ChangeFontsizeState(fontSize: fs));
  // }

  // Future<void> _loadFontSizeFromPref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   fs = prefs.getDouble('fontSize') ?? 35;
  //   emit(ChangeFontsizeState(fontSize: fs));
  // }

  Future<void> _saveFontSizeToPref(double fs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', fs);
  }
}
