import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ui/database/tables/tables.dart';
import 'package:ui/features/dashboard/view_model/recently_added_viewmodel.dart'
    show recentlyAddedVMProvider;
import 'package:ui/features/dashboard/widgets/_list_section_header.dart';
import 'package:ui/features/dashboard/widgets/_list_tile.dart'
    show CustomListTile;

class RecentlyAddedView extends HookConsumerWidget {
  const RecentlyAddedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(recentlyAddedVMProvider);

    return CupertinoListSection.insetGrouped(
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
        ...vm.when(
          data:
              (value) =>
                  value.map((item) => CustomListTile(item: item)).toList(),
          error: (error, _) => [Text('asad $error')],
          loading: () => [CupertinoActivityIndicator()],
        ),
      ],
    );
  }
}
