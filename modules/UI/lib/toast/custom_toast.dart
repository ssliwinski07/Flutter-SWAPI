import 'package:flutter/material.dart';
import '/utils/helpers/enums.dart';

void showCustomToast({
  required BuildContext context,
  required String message,
  required InfoType infoType,
}) {
  final snackBar = SnackBar(
    content: Text(
      style: const TextStyle(
        fontSize: 18,
      ),
      message,
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: switch (infoType) {
      InfoType.error => Colors.redAccent,
      InfoType.warning => Colors.orange,
      InfoType.success => Colors.green,
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
