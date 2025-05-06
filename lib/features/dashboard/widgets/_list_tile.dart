import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/features/dashboard/model/recently_added_model.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/logger.dart';

class CustomListTile extends HookWidget {
  const CustomListTile({required this.item, super.key});

  final RecentlyAddedModel item;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      padding: EdgeInsets.symmetric(vertical: Gutters.sm),
      title: Text(item.itemName),
      subtitle: Text(item.description ?? ''),
      trailing: CupertinoListTileChevron(),
      onTap: () => logger.d('belum ada function ${item.id}'),
    );
  }
}
