import 'package:flutter/cupertino.dart';

extension BuildContextExtension on BuildContext {
  CupertinoTextThemeData get textTheme => CupertinoTheme.of(this).textTheme;
  Color get primaryColor => CupertinoTheme.of(this).primaryColor;

  Size get sizeOf => MediaQuery.sizeOf(this);
}
