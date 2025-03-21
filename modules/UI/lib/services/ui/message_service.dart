import 'package:connector_module/exports/services.dart';
import 'package:connector_module/exports/enums.dart';
import 'package:flutter/material.dart';

import '/utils/helpers/global_keys.dart';

class MessageService implements MessageServiceInterface {
  @override
  void show({
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
      duration: _buildDuration(infoType),
      backgroundColor: _buildInfoType(infoType),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
    );

    messagesKey.currentState!.showSnackBar(snackBar);
  }

  Duration _buildDuration(InfoType infoType) {
    switch (infoType) {
      case InfoType.error:
        return const Duration(seconds: 4);
      case InfoType.warning:
        return const Duration(seconds: 3);
      case InfoType.success:
        return const Duration(seconds: 3);
    }
  }

  Color _buildInfoType(InfoType infoType) {
    switch (infoType) {
      case InfoType.error:
        return Colors.redAccent;
      case InfoType.warning:
        return Colors.orange;
      case InfoType.success:
        return Colors.green;
    }
  }
}
