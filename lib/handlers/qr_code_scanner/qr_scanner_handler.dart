import 'package:sophie_messenger_app/handlers/permission_handler.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerHanler {
  Future<String> scanQrCode() async {
    if (await PermissionHandler().checkCameraPermission()) {
      Barcode code = await CustomNavigator.push(Routes.qrScannerCode);
      return code.code ?? "";
    }
    return "";
  }
}
