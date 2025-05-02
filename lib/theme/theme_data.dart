import 'package:flutter/cupertino.dart';
import 'package:ui/theme/color.dart';

final temaAplikasi = CupertinoThemeData(
  primaryColor: CupertinoColors.systemIndigo,
  applyThemeToAll: true,
  brightness: Brightness.light,
  textTheme: CupertinoTextThemeData(
    navLargeTitleTextStyle: const CupertinoThemeData()
        .textTheme
        .navLargeTitleTextStyle
        .copyWith(color: AppColors.color1),
  ),
);
