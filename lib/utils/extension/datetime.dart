import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

enum TimeAgoOperation { tambah, tolak }

extension DateTimeExtension on DateTime {
  String get tarikhNumeral => DateFormat('d/MM/yyyy').format(this);
  String get tarikhBulanPerkataan =>
      DateFormat('d MMMM yyyy', 'ms').format(this);

  String get berbandingSekarang =>
      timeago.format(this, locale: 'ms', allowFromNow: true);
}

extension DateTimeNullableExtension on DateTime? {
  String get tarikhNumeral =>
      this == null ? '-' : DateFormat('d/MM/yyyy').format(this!);
  String get tarikhBulanPerkataan =>
      this == null ? '-' : DateFormat('d MMMM yyyy', 'ms').format(this!);

  String get berbandingSekarang =>
      this == null
          ? '-'
          : timeago.format(this!, locale: 'ms', allowFromNow: true);
}
