import 'package:bloc/bloc.dart';

class SelectionCubit<T> extends Cubit<T?> {
  SelectionCubit() : super(null);

  void selectItem({required T? item}) {
    emit(item);
  }

  void deselectItem() {
    emit(null);
  }

  void toggleSelection({required T item}) {
    emit(state == item ? null : item);
  }
}
