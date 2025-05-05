import 'package:flutter/cupertino.dart';

Widget placeholderForPicker({
  required String? value,
  required TextStyle style,
  required String placeholder,
}) {
  final shouldShowPlaceholder =
      value == null || value == '-' || value.trim().isEmpty;

  return Text(
    shouldShowPlaceholder ? placeholder : value,
    style:
        shouldShowPlaceholder
            ? style.copyWith(color: CupertinoColors.inactiveGray)
            : style,
  );
}
