import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ui/features/dashboard/widgets/_assemble_overview_cards.dart';
import 'package:ui/features/dashboard/widgets/_recently_added_view.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/widgets/sliver_nav_bar.dart';

const _title = 'Ringkasan';

class DashboardView extends HookConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          SliverNavBar(largeTitle: _title, middle: _title),
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
                RecentlyAddedView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
