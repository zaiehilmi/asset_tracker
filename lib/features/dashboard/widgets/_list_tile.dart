import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/features/dashboard/model/recently_added_model.dart';
import 'package:ui/features/dashboard/view_model/dashboard_viewmodel.dart';
import 'package:ui/features/item_management/item_detail/item_detail_screen.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/extension/buildcontext.dart';
import 'package:ui/utils/logger.dart';

class CustomListTile extends HookWidget {
  const CustomListTile({required this.item, this.isLoading = false, super.key});

  final RecentlyAddedModel item;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    Future<void> onTapTile() async {
      await dashboardState.fetchItem(item.id);

      if (context.mounted) {
        context.navigateByPushTo(
          rootNavigator: true,
          builder: (_) => ItemDetailScreen(),
        );
      } else {
        logger.w('item tidak ada');
      }
    }

    return CupertinoListTile(
      padding: EdgeInsets.symmetric(vertical: Gutters.sm),
      title: Text(item.itemName),
      subtitle: Text(item.description ?? ''),
      trailing: CupertinoListTileChevron(),
      onTap: onTapTile,
    );
  }
}
