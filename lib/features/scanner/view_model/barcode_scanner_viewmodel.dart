import 'package:june/june.dart';

final barcodeScannerVMState = June.getState(BarcodeScannerVM.new);

class BarcodeScannerVM extends JuneState {
  String? barcode;
}
