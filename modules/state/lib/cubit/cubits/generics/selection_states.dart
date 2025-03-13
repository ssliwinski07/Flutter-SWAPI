part of 'selection_cubit.dart';

@freezed
sealed class SelectionStates<T> with _$SelectionStates {
  const factory SelectionStates.initial() = Initial<T>;
  const factory SelectionStates.singleSelection({required T item}) =
      SingleSelection<T>;
  const factory SelectionStates.multiSelection({required Set<T> items}) =
      MultiSelection<T>;
}
