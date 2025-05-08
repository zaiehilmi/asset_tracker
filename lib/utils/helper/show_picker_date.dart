import 'package:flutter/cupertino.dart';
import 'package:ui/utils/extension/buildcontext.dart';
import 'package:ui/utils/helper/show_picker.dart' show showPicker;

void showPickerDate<T>(
  BuildContext context, {
  required ValueNotifier<DateTime?> date,
  bool showClearButton = false,
}) {
  showPicker<T>(
    context,
    child: Column(
      children: [
        if (showClearButton)
          Align(
            alignment: Alignment.topRight,
            child: CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Kosongkan',
                style: context.textTheme.actionSmallTextStyle.copyWith(
                  color: CupertinoColors.destructiveRed,
                ),
              ),
              onPressed: () {
                date.value = null;
                Navigator.of(context).pop();
              },
            ),
          ),
        Expanded(
          child: CupertinoDatePicker(
            initialDateTime: date.value ?? DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (newDate) => date.value = newDate,
          ),
        ),
      ],
    ),
  );
}
