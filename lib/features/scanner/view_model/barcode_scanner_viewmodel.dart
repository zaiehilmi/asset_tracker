import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'barcode_scanner_viewmodel.g.dart';

@riverpod
class BarcodeScannerViewmodel extends _$BarcodeScannerViewmodel {
  @override
  String build() {
    return '';
  }

  String get barcode => state;
  set barcode(String value) => state = value;
}
