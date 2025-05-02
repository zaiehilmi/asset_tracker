import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/features/search/data/kategori_data.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/extension/buildcontext.dart';

class CardItem extends HookWidget {
  const CardItem({required this.data, super.key});

  final KategoriData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: data.backgroundColor.withAlpha(200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          ClipRRect(
            child: Icon(
              data.icon ?? Amicons.vuesax_slash,
              size: 130,
              color: CupertinoColors.darkBackgroundGray.withAlpha(55),
            ),
          ),
          Positioned(
            bottom: Gutters.sm,
            left: Gutters.sm,
            right: Gutters.sm,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 50),
              child: Text(
                data.kategori,
                style: context.textTheme.textStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
