import 'package:june/june.dart';

final barcodeScannerState = June.getState(BarcodeScannerVM.new);

class BarcodeScannerVM extends JuneState {
  String? barcode;

  // ignore: avoid_setters_without_getters
  set setBarcode(String value) {
    barcode = value;
    setState();
  }

  void resetBarcode() {
    barcode = null;
    setState();
  }
}
