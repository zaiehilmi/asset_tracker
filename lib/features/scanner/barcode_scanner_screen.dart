import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BarcodeScannerScreen extends HookWidget {
  const BarcodeScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Center(child: Text('Pengimbas')));
  }
}
