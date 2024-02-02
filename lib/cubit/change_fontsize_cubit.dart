import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_fontsize_state.dart';

class ChangeFontsizeCubit extends Cubit<ChangeFontsizeState> {
  double fs = 5;
  ChangeFontsizeCubit() : super(const ChangeFontsizeState(fontSize: 5)) {
    _loadFontSizeFromPref();
  }

  void changeFontSize(double newFs) {
    fs = newFs;
    _saveFontSizeToPref(fs);
    emit(ChangeFontsizeState(fontSize: fs));
  }

  Future<void> _loadFontSizeFromPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fs = prefs.getDouble('fontSize') ?? fs;
    emit(ChangeFontsizeState(fontSize: fs));
  }

  Future<void> _saveFontSizeToPref(double fs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', fs);
  }
}
