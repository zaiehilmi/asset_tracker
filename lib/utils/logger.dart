import 'package:intl/intl.dart' show DateFormat;
import 'package:roggle/roggle.dart';

final logger = Roggle(printer: _prettyPrinter);

// MARK: - Configuration

final _prettyPrinter = SinglePrettyPrinter(
  loggerName: '[UI]',
  printFunctionName: false,
  stackTracePrefix: '|',
  timeFormatter: (now) => DateFormat('HH:mm:ss').format(now),
);
