import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/database/tables/items/item.dart';
import 'package:ui/database/tables/items/item_repository.dart'
    show ItemRepository;
import 'package:ui/features/dashboard/widgets/_assemble_overview_cards.dart';
import 'package:ui/features/dashboard/widgets/_list_section_header.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/widgets/sliver_nav_bar.dart';

class DashboardView extends HookWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
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
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: Gutters.md,
                //     vertical: Gutters.sm,
                //   ),
                //   child: AssembleOverviewCards(),
                // ),
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
                    CupertinoListTile(
                      padding: EdgeInsets.symmetric(vertical: Gutters.sm),
                      leading: FlutterLogo(),
                      title: Text('Two-line CupertinoListTile'),
                      subtitle: Text('Here is a subtitle'),
                      // trailing: Icon(Amicons.remix_more2),
                    ),
                    CupertinoListTile(
                      padding: EdgeInsets.symmetric(vertical: Gutters.sm),
                      leading: FlutterLogo(),
                      title: Text('Two-line CupertinoListTile'),
                      subtitle: Text('Here is a subtitle'),
                      // trailing: Icon(Amicons.remix_more2),
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
