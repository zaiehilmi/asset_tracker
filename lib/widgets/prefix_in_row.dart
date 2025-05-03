import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/theme/guttters.dart';

class PrefixInRow extends HookWidget {
  const PrefixInRow({
    required this.icon,
    required this.iconBackgroundColor,
    super.key,
  });

  final IconData icon;
  final Color iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: iconBackgroundColor,
        borderRadius: BorderRadius.circular(Gutters.xs),
      ),
      child: Center(child: Icon(icon, color: CupertinoColors.white, size: 20)),
    );
  }
}
