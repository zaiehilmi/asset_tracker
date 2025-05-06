import 'package:flutter/cupertino.dart';

Future<void> showAlertDialog<T>(
  BuildContext context, {
  required List<CupertinoDialogAction> actions,
  String title = 'Perhatian',
  String? content = '',
}) async {
  await showCupertinoDialog<void>(
    context: context,
    builder:
        (BuildContext context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(content!),
          actions: actions,
        ),
  );
}
