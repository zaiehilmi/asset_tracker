import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:june/june.dart';
import 'package:ui/features/dashboard/view_model/dashboard_viewmodel.dart';
import 'package:ui/features/dashboard/widgets/_actions_view.dart';
import 'package:ui/features/dashboard/widgets/_assemble_overview_cards.dart';
import 'package:ui/features/dashboard/widgets/_recently_added_view.dart';
import 'package:ui/theme/guttters.dart';
import 'package:ui/utils/extension/buildcontext.dart';
import 'package:ui/widgets/loading_indicator_screen.dart'
    show LoadingIndicatorScreen;
import 'package:ui/widgets/sliver_nav_bar.dart';

const _title = 'Ringkasan';

class DashboardScreen extends HookWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = context.padding.bottom + kBottomNavigationBarHeight;

    return JuneBuilder(
      DashboardVM.new,
      builder:
          (vm) => LoadingIndicatorScreen(
            isLoading: vm.isLoading,
            child: CupertinoPageScaffold(
              child: CustomScrollView(
                slivers: [
                  const SliverNavBar(largeTitle: _title, middle: _title),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Gutters.md,
                      ),
                      child: Divider(
                        color: CupertinoColors.separator.withAlpha(30),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        const AssembleOverviewCards(),
                        const ActionsView(),
                        const RecentlyAddedView(),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
