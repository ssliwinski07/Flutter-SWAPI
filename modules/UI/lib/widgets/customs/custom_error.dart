import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError(
      {super.key, required this.onRefresh, required this.errorMessage});

  final Future<void> Function() onRefresh;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error),
            const SizedBox(width: 10),
            Text(errorMessage),
          ],
        ),
        const SizedBox(height: 5),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () async {
            await onRefresh();
          },
        )
      ],
    );
  }
}
