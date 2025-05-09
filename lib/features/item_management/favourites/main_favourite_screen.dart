import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainFavouriteScreen extends HookWidget {
  const MainFavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(automaticallyImplyMiddle: false),
      child: Center(
        child: CupertinoButton(
          child: const Text('Go back'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
