import '/utils/helpers/enums/enums.dart';

abstract interface class MessageServiceInterface {
  void show({
    required String message,
    required InfoType infoType,
  });
}
