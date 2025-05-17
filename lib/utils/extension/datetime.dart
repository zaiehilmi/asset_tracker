import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

enum TimeAgoOperation { tambah, tolak }

extension DateTimeExtension on DateTime {
  /// akan format menjadi `31/01/2023`
  String get tarikhNumeral => DateFormat('d/MM/yyyy').format(this);

  /// akan format menjadi `31 Januari 2023`
  String get tarikhBulanPerkataan =>
      DateFormat('d MMMM yyyy', 'ms').format(this);

  String get berbandingSekarang =>
      timeago.format(this, locale: 'ms', allowFromNow: true);
}

extension DateTimeNullableExtension on DateTime? {
  /// akan format menjadi `31/01/2023` tapi kalau null akan return `-`
  String get tarikhNumeral =>
      this == null ? '-' : DateFormat('d/MM/yyyy').format(this!);

  /// akan format menjadi `31 Januari 2023` tapi kalau null akan return `-`
  String get tarikhBulanPerkataan =>
      this == null ? '-' : DateFormat('d MMMM yyyy', 'ms').format(this!);

  String get berbandingSekarang =>
      this == null
          ? '-'
          : timeago.format(this!, locale: 'ms', allowFromNow: true);
}
