import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FullScreenDialogScaffold extends HookWidget {
  const FullScreenDialogScaffold({
    required this.child,
    super.key,
    this.title,
    this.previousPageTitle,
    this.trailing,
    this.backgroundColor,
    this.onTap,
  });

  final Widget? child;
  final Widget? title;
  final String? previousPageTitle;
  final Widget? trailing;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return GestureDetector(
      onTap: onTap,
      child: CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: previousPageTitle,
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Text('Tutup'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          middle: title,
          trailing: trailing,
        ),

        child: SafeArea(
          bottom: false,
          child: CupertinoScrollbar(
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
