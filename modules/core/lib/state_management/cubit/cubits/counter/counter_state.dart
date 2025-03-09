part of 'counter_cubit.dart';

@freezed
sealed class CounterState with _$CounterState {
  const factory CounterState.count(int count) = Count;
}
