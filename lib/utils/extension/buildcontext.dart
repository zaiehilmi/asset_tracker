import 'package:flutter/cupertino.dart';

extension BuildContextExtension on BuildContext {
  CupertinoTextThemeData get textTheme => CupertinoTheme.of(this).textTheme;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  Color get primaryColor => CupertinoTheme.of(this).primaryColor;

  Size get sizeOf => MediaQuery.sizeOf(this);
}

extension Navigation on BuildContext {
  void fullScreenDialogRoute<T>({
    required Widget Function(BuildContext) builder,
    void Function(T?)? onComplete,
    bool rootNavigator = false,
  }) {
    Navigator.of(this, rootNavigator: rootNavigator)
        .push<T>(CupertinoPageRoute(fullscreenDialog: true, builder: builder))
        .then((value) {
          onComplete?.call(value);
        });
  }

  void navigateByPushTo({
    required Widget Function(BuildContext) builder,
    bool rootNavigator = false,
    bool maintainState = false,
  }) {
    Navigator.push(this, CupertinoPageRoute<void>(builder: builder));
    Future<void>.delayed(
      Duration(milliseconds: 500),
    ).then((_) => Navigator.pop(this));

    Navigator.of(this, rootNavigator: rootNavigator).push(
      CupertinoPageRoute<void>(maintainState: maintainState, builder: builder),
    );
  }

  void navigateByPushAndRemoveUntil({
    required Widget Function(BuildContext) builder,
  }) {
    Navigator.of(this).pushAndRemoveUntil(
      CupertinoPageRoute<void>(maintainState: false, builder: builder),
      (route) => false,
    );
  }
}
