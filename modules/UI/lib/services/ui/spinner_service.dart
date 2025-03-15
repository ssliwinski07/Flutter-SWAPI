import 'package:connector_module/exports/ui_services.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '/utils/helpers/global_keys.dart';

class SpinnerService implements SpinnerServiceInterface {
  @override
  void show() {
    globalLoaderOverlayKey.currentContext?.loaderOverlay.show();
  }

  @override
  void hide() {
    globalLoaderOverlayKey.currentContext?.loaderOverlay.hide();
  }
}
