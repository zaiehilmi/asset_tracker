import 'package:flutter/cupertino.dart';

extension BuildContextExtension on BuildContext {
  CupertinoTextThemeData get textTheme => CupertinoTheme.of(this).textTheme;

  Size get sizeOf => MediaQuery.sizeOf(this);
}
