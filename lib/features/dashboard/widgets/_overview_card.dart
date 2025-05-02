import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/theme/border.dart';
import 'package:ui/theme/color.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/extension/buildcontext.dart';

class OverviewCard extends HookWidget {
  const OverviewCard({
    required this.title,
    this.iconColor = AppColors.color1,
    this.titleFontSize = 14,
    this.subTitle = '',
    this.subTitleColor = AppColors.color1,
    this.subTitleFontSize,
    this.spaceBetweenTitleAndSubTitle = MainAxisAlignment.center,
    this.backgroundColor = CupertinoColors.secondarySystemBackground,
    this.icon,
    this.iconSize = 16,
    this.isLoading = false,
    super.key,
  });

  final String title;
  final Color? iconColor;
  final double titleFontSize;
  final String? subTitle;
  final Color? subTitleColor;
  final double? subTitleFontSize;
  final IconData? icon;
  final double? iconSize;
  final MainAxisAlignment spaceBetweenTitleAndSubTitle;
  final Color backgroundColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppBorder.lg),
      ),
      padding: const EdgeInsets.all(Gutters.md),
      child: Column(
        mainAxisAlignment: spaceBetweenTitleAndSubTitle,
        spacing: Gutters.md,
        children: [
          Row(
            spacing: Gutters.sm,
            children: [
              if (icon != null)
                Container(
                  padding: EdgeInsets.all(Gutters.xs),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppBorder.full),
                    color: iconColor,
                  ),
                  child: Icon(
                    icon,
                    color: CupertinoColors.white,
                    size: iconSize,
                  ),
                ),

              Flexible(
                child: Text(
                  title,
                  style: context.textTheme.textStyle.copyWith(
                    color: CupertinoColors.secondaryLabel,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomRight,
            child:
                !isLoading
                    ? RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: subTitle ?? '',
                            style: context.textTheme.pickerTextStyle.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: subTitleFontSize,
                              color: subTitleColor,
                            ),
                          ),
                          TextSpan(
                            text: ' item',
                            style: context.textTheme.textStyle.copyWith(
                              color: subTitleColor?.withAlpha(180),
                              fontSize: titleFontSize / 1.1,
                            ),
                          ),
                        ],
                      ),
                    )
                    : CupertinoActivityIndicator(radius: 12),
          ),
        ],
      ),
    );
  }
}
