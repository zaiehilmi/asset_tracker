import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:june/state_manager.dart';

import 'package:ui/database/tables/tables.dart';
import 'package:ui/features/dashboard/view_model/recently_added_viewmodel.dart';
import 'package:ui/features/dashboard/widgets/_list_section_header.dart';
import 'package:ui/features/dashboard/widgets/_list_tile.dart'
    show CustomListTile;
import 'package:ui/theme/guttters.dart';

class RecentlyAddedView extends HookWidget {
  const RecentlyAddedView({super.key});

  @override
  Widget build(BuildContext context) {
    // useEffect(() {
    //   recentlyAddedState.fetchRecentlyAddedItems();

    //   return null;
    // }, []);

    return JuneBuilder(
      RecentlyAddedVM.new,
      builder:
          (vm) => CupertinoListSection.insetGrouped(
            hasLeading: false,
            margin: EdgeInsets.symmetric(horizontal: Gutters.sm),
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
                const CupertinoActivityIndicator()
              else
                ...?vm.recentlyAddedItems?.map(
                  (item) => CustomListTile(item: item),
                ),
            ],
          ),
    );
  }
}
