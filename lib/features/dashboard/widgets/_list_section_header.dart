import 'package:flutter/cupertino.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/extension/buildcontext.dart';

class ListSectionHeader extends HookWidget {
  const ListSectionHeader({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.textStyle;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Row(
        spacing: Gutters.xs,
        children: [
          Text(
            title,
            style: textStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const CupertinoListTileChevron(),
        ],
      ),
    );
  }
}
