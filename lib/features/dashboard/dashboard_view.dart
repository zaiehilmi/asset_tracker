import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/database/tables/items/item.dart';
import 'package:ui/database/tables/items/item_repository.dart'
    show ItemRepository;
import 'package:ui/features/dashboard/view_model/recently_added_viewmodel.dart';
import 'package:ui/features/dashboard/widgets/_assemble_overview_cards.dart';
import 'package:ui/features/dashboard/widgets/_list_section_header.dart';
import 'package:ui/features/dashboard/widgets/_list_tile.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/widgets/sliver_nav_bar.dart';

class DashboardView extends HookConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentlyAddedVM = ref.watch(recentlyAddedVMProvider);

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          SliverNavBar(largeTitle: 'Sekilas Info', middle: 'Sekilas Info'),
          SliverFillRemaining(
            child: Column(
              spacing: Gutters.md,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Gutters.md),
                  child: Divider(
                    color: CupertinoColors.separator.withAlpha(30),
                  ),
                ),
                AssembleOverviewCards(),
                CupertinoListSection.insetGrouped(
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
                    ...recentlyAddedVM.when(
                      data:
                          (value) =>
                              value
                                  .map((item) => CustomListTile(item: item))
                                  .toList(),
                      error: (error, _) => [Text('asad $error')],
                      loading: () => [CupertinoActivityIndicator()],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
