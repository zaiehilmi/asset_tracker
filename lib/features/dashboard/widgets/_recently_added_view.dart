import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:june/state_manager.dart';

import 'package:ui/database/tables/tables.dart';
import 'package:ui/features/dashboard/view_model/recently_added_viewmodel.dart';
import 'package:ui/features/dashboard/widgets/_list_section_header.dart';
import 'package:ui/features/dashboard/widgets/_list_tile.dart'
    show CustomListTile;

class RecentlyAddedView extends HookConsumerWidget {
  const RecentlyAddedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      recentlyAddedState.fetchRecentlyAddedItems();

      return null;
    }, []);

    return JuneBuilder(
      RecentlyAddedVM.new,
      builder:
          (vm) => CupertinoListSection.insetGrouped(
            hasLeading: false,
            backgroundColor: CupertinoColors.systemBackground,
            header: ListSectionHeader(
              title: 'Terbaru Ditambah',
              onPressed: () async {
                final item = await ItemRepository().readAll();

                debugPrint(item[0].toJsonString());
              },
            ),
            children: [
              if (vm.isLoading)
                CupertinoActivityIndicator()
              else
                ...?vm.recentlyAddedItems?.map(
                  (item) => CustomListTile(item: item),
                ),
            ],
          ),
    );
  }
}
