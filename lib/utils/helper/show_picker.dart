import 'package:flutter/cupertino.dart';
import 'package:ui/theme/guttters.dart';

Future<T?> showPicker<T>(BuildContext context, {required Widget child}) async =>
    showCupertinoModalPopup<T>(
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
