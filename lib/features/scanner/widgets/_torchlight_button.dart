import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/theme/border.dart' show AppBorder;
import 'package:ui/theme/guttters.dart' show Gutters;

class TorchlightButton extends HookWidget {
  const TorchlightButton({this.onPressed, super.key});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final isTurnOn = useState(false);

    const iconSize = 20.0;

    void handlePress() {
      onPressed?.call();
      isTurnOn.value = !isTurnOn.value;
    }

    if (isTurnOn.value) {
      return CupertinoButton.filled(
        padding: EdgeInsets.all(Gutters.md),
        borderRadius: BorderRadius.circular(AppBorder.full),
        onPressed: handlePress,
        child: Icon(CupertinoIcons.bolt_fill, size: iconSize),
      );
    }

    return CupertinoButton.tinted(
      padding: EdgeInsets.all(Gutters.md),
      borderRadius: BorderRadius.circular(AppBorder.full),
      onPressed: handlePress,
      child: Icon(CupertinoIcons.bolt, size: iconSize),
    );
  }
}
