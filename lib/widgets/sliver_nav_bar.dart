import 'package:flutter/cupertino.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SliverNavBar extends HookWidget {
  const SliverNavBar({required this.largeTitle, this.middle, super.key});

  final String largeTitle;
  final String? middle;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      backgroundColor: CupertinoColors.white.withAlpha(150),
      middle: Text(largeTitle),
      alwaysShowMiddle: false,
      largeTitle: GradientAnimationText(
        text: Text(middle ?? largeTitle),
        colors: [CupertinoColors.black, CupertinoColors.black.withAlpha(200)],
        duration: const Duration(seconds: 5),
        reverse: true,
        transform: const GradientRotation(24),
      ),
      border: Border.all(color: CupertinoColors.separator),
    );
  }
}
