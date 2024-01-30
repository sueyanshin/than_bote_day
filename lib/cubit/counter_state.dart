part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {
  final int count;
  CounterInitial({required this.count});
}

final class CounterValue extends CounterState {
  final int value;
  CounterValue({required this.value});
}

final class CounterIncremented extends CounterState {}

final class CounterReseted extends CounterState {}
