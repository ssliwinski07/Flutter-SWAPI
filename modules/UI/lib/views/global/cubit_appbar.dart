import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitAppBar<C extends Cubit<S>, S> extends StatelessWidget {
  const CubitAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: BlocBuilder<C, S>(builder: (context, state) {
      return const IconButton(
          icon: Icon(Icons.refresh, size: 30), onPressed: null);
    }));
  }
}
