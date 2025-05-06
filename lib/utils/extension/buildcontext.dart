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

  void navigateByPushTo({required Widget Function(BuildContext) builder}) {
    Navigator.of(
      this,
    ).push(CupertinoPageRoute<void>(maintainState: false, builder: builder));
  }

  void navigateByPushAndRemoveUntil({
    required Widget Function(BuildContext) builder,
  }) {
    Navigator.of(this).pushAndRemoveUntil(
      CupertinoPageRoute<void>(maintainState: false, builder: builder),
      (route) => false,
    );
  }

  Size get sizeOf => MediaQuery.sizeOf(this);
}
