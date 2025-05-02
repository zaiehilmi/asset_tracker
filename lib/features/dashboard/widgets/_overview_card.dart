import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/theme/border.dart';
import 'package:ui/theme/color.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/extension/buildcontext.dart';

class OverviewCard extends HookWidget {
  const OverviewCard({
    required this.title,
    this.iconBackgroundColor = AppColors.color1,
    this.iconColor = CupertinoColors.white,
    this.titleFontSize = 14,
    this.statNumber = '',
    this.statNumberColor = AppColors.color1,
    this.statNumberFontSize,
    this.backgroundColor = CupertinoColors.secondarySystemBackground,
    this.icon,
    this.iconSize = 16,
    this.isLoading = false,
    this.titleColor = CupertinoColors.secondaryLabel,
    super.key,
  });

  final String title;
  final Color titleColor;
  final Color? iconBackgroundColor;
  final double titleFontSize;
  final String? statNumber;
  final Color? statNumberColor;
  final double? statNumberFontSize;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color backgroundColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppBorder.lg),
      ),
      padding: const EdgeInsets.all(Gutters.sm),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Gutters.sm,
        children: [
          Row(
            spacing: Gutters.sm,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (icon != null)
                Container(
                  padding: EdgeInsets.all(Gutters.xs),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppBorder.full),
                    color: iconBackgroundColor,
                  ),
                  child: Icon(icon, color: iconColor, size: iconSize),
                ),
              Padding(
                padding: EdgeInsets.only(right: Gutters.md),
                child:
                    isLoading
                        ? CupertinoActivityIndicator(
                          radius: 11,
                          color: statNumberColor,
                        )
                        : Text(
                          statNumber ?? '',
                          style: context.textTheme.pickerTextStyle.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: statNumberFontSize,
                            color: statNumberColor,
                          ),
                        ),
              ),
            ],
          ),

          Flexible(
            child: Text(
              title,
              style: context.textTheme.textStyle.copyWith(
                color: titleColor,
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
