import '../cubits/general_states/base_states_general.dart';
import 'package:bloc/bloc.dart';

mixin SelectionMixin<T> {
  T? selectedItem;

  // Method to select an item by index
  void selectItem(int index, List<T> items) {
    if (index >= 0 && index < items.length) {
      selectedItem = items[index];
    }
  }
}

/*
mixin SelectionMixin<T> on Cubit<BaseStates<T>> {
  void selectItem({required dynamic value}) {
    emit(BaseStates.selected(state == value ? null : value));
  }
}
*/

/*
mixin SelectionMixin<T> on Cubit<T?> {
  void selectItem({required T value}) {
    emit(state == value ? null : value);
  }
}
*/
