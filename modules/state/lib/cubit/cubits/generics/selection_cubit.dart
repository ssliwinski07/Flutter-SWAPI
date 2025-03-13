import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_cubit.freezed.dart';
part 'selection_states.dart';

class SelectionCubit<T> extends Cubit<SelectionStates<T>> {
  SelectionCubit() : super(const SelectionStates.initial());

  void selectItem({required T? item}) {}

  void deselectItem() {
    emit(const MultiSelection(items: {}));
  }

  void toggleMultiSelection({required T item}) {
    Set<T> selectedItems = state is MultiSelection<T>
        ? Set<T>.from((state as MultiSelection<T>).items)
        : {};

    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }

    emit(MultiSelection(items: selectedItems));
  }

  void toggleSingleSelection({required T item}) {
    if ((state is SingleSelection<T>) &&
        (state as SingleSelection<T>).item == item) {
      emit(const SelectionStates.initial());
    } else {
      emit(SingleSelection(item: item));
    }
  }
}
