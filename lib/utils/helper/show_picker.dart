import 'package:flutter/cupertino.dart';
import 'package:ui/theme/guttters.dart';

void showPicker<T>(BuildContext context, {required Widget child}) =>
    showCupertinoModalPopup<void>(
      context: context,
      builder:
          (BuildContext context) => Container(
            height: 250,
            padding: const EdgeInsets.only(top: Gutters.sm),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: child,
          ),
    );
