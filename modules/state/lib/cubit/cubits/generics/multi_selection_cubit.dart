import 'package:bloc/bloc.dart';

class MultiSelectionCubit<T> extends Cubit<Set<T>> {
  MultiSelectionCubit() : super({});

  void clearSelection() {
    emit({});
  }

  void selectItems({required T item}) {
    final newSelection = Set<T>.from(state);

    if (newSelection.contains(item)) {
      newSelection.remove(item);
    } else {
      newSelection.add(item);
    }

    emit(newSelection);
  }
}
