import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get tarikhNumeral => DateFormat('d/MM/yyyy').format(this);
  String get tarikhBulanPerkataan =>
      DateFormat('d MMMM yyyy', 'ms').format(this);
}

extension DateTimeNullableExtension on DateTime? {
  String get tarikhNumeral =>
      this == null ? '-' : DateFormat('d/MM/yyyy').format(this!);
  String get tarikhBulanPerkataan =>
      this == null ? '-' : DateFormat('d MMMM yyyy', 'ms').format(this!);
}
