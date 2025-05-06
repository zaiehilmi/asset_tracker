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

  void navigateTo({required Widget Function(BuildContext) builder}) {
    Navigator.of(
      this,
    ).push(CupertinoPageRoute<void>(maintainState: false, builder: builder));
  }

  Size get sizeOf => MediaQuery.sizeOf(this);
}
