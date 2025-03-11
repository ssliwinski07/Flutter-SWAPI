import 'package:bloc/bloc.dart';

class SelectionCubit<T> extends Cubit<T?> {
  SelectionCubit() : super(null);

  void selectItem({required T value}) {
    emit(state == value ? null : value);
  }
}
