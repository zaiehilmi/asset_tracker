import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoadingIndicatorScreen extends HookWidget {
  const LoadingIndicatorScreen({
    required this.child,
    this.isLoading = false,
    super.key,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        AnimatedOpacity(
          opacity: isLoading ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: IgnorePointer(
            ignoring: !isLoading,
            child: ColoredBox(
              color: CupertinoColors.systemGrey.withOpacity(0.3),
              child: const Center(child: CupertinoActivityIndicator()),
            ),
          ),
        ),
      ],
    );
  }
}
