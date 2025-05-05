String formatHarga(String value) {
  if (value.isEmpty) return '0.00';

  final format = value.replaceAll(RegExp('[^0-9]'), '');
  final cents = int.parse(format);

  final keSen = (cents / 100).toStringAsFixed(2);

  return keSen;
}
