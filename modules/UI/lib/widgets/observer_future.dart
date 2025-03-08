import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../utils/enums/enums.dart';

class ObserverFuture<T> extends StatefulWidget {
  const ObserverFuture({
    super.key,
    required this.loadingState,
    required this.dataGetter,
    required this.fetchData,
    required this.onFullfilled,
  });

  final LoadingStates Function() loadingState;
  final T? Function() dataGetter;
  final Future<void> Function() fetchData;
  final Widget Function(T? data) onFullfilled;

  @override
  State<ObserverFuture<T>> createState() => _ObserverFutureState<T>();
}

class _ObserverFutureState<T> extends State<ObserverFuture<T>> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final state = widget.loadingState();
      final data = widget.dataGetter();

      switch (state) {
        case LoadingStates.pending:
          return const CircularProgressIndicator();
        case LoadingStates.rejected:
          return const Text('Error');
        case LoadingStates.fulfilled:
          if (data == null) {
            return const Text('Data is null');
          }
          if (data is Iterable && data.isEmpty) {
            return const Text('Data is empty');
          }
          return widget.onFullfilled(data);
      }
    });
  }
}
