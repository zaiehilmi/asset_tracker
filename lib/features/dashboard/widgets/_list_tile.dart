import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/features/dashboard/model/recently_added_model.dart';
import 'package:ui/features/dashboard/view_model/dashboard_viewmodel.dart';
import 'package:ui/features/item_management/item_detail/item_detail_screen.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/extension/buildcontext.dart';

class CustomListTile extends HookWidget {
  const CustomListTile({required this.item, super.key});

  final RecentlyAddedModel item;

  @override
  Widget build(BuildContext context) {
    Future<void> onTapTile() async {
      await dashboardState.fetchItem(item.id);

      Future.delayed(const Duration(milliseconds: 300), () {
        if (context.mounted) {
          context.navigateByPushTo(
            rootNavigator: true,
            maintainState: true,
            builder: (_) => const ItemDetailScreen(),
          );
        }
      });
    }

    return CupertinoListTile(
      padding: const EdgeInsets.symmetric(
        vertical: Gutters.sm,
        horizontal: Gutters.md,
      ),
      title: Text(item.itemName),
      subtitle: Text(item.description ?? ''),
      trailing: const CupertinoListTileChevron(),
      onTap: onTapTile,
    );
  }
}
