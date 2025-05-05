import 'package:flutter/cupertino.dart';

Widget placeholderForPicker({
  required String value,
  required TextStyle style,
  required String placeholder,
}) {
  final isEmpty = value.trim().isEmpty;

  return Text(
    isEmpty ? placeholder : value,
    style:
        isEmpty ? style.copyWith(color: CupertinoColors.inactiveGray) : style,
  );
}
