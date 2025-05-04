import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/utils/extension/buildcontext.dart';

class PrefixInTextForm extends HookWidget {
  const PrefixInTextForm({
    required this.text,
    super.key,
    this.fontSize = 14,
    this.isRequired = false,
    this.width = 55,
  });

  final double fontSize;
  final bool isRequired;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: RichText(
        text: TextSpan(
          text: text,
          style: DefaultTextStyle.of(
            context,
          ).style.copyWith(fontSize: fontSize, fontWeight: FontWeight.w500),
          children: [
            if (isRequired)
              TextSpan(
                text: ' *',
                style: TextStyle(
                  color: CupertinoColors.systemRed,
                  fontSize: fontSize,
                ),
              )
            else
              const TextSpan(),
          ],
        ),
      ),
    );
  }
}
