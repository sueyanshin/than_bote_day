import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int count = 0;
  CounterCubit() : super(CounterInitial(count: 0)) {
    _loadCounterFromPrefs();
  }

  void increment() {
    count++;
    _saveCounterToPrefs();
    emit(CounterValue(value: count));
  }

  void reset() {
    count = 0;
    _saveCounterToPrefs();
    emit(CounterValue(value: count));
  }

  Future<void> _loadCounterFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    count = prefs.getInt('counter') ?? 0;
    emit(CounterValue(value: count));
  }

  Future<void> _saveCounterToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', count);
  }

  @override
  void onChange(Change<CounterState> change) {
    super.onChange(change);
  }
}
