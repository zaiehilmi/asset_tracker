import 'package:flutter/cupertino.dart';

extension BuildContextExtension on BuildContext {
  CupertinoTextThemeData get textTheme => CupertinoTheme.of(this).textTheme;
  Color get primaryColor => CupertinoTheme.of(this).primaryColor;

  void fullScreenDialogRoute({required Widget Function(BuildContext) builder}) {
    Navigator.of(
      this,
      rootNavigator: true,
    ).push(CupertinoPageRoute<void>(fullscreenDialog: true, builder: builder));
  }

  Size get sizeOf => MediaQuery.sizeOf(this);
}
