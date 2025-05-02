import 'package:amicons/amicons.dart' show Amicons;
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/features/dashboard/view_model/overview_viewmodel.dart'
    show overviewStatisticsVMProvider;
import 'package:ui/features/dashboard/widgets/_overview_card.dart'
    show OverviewCard;
import 'package:ui/theme/color.dart' show AppColors;
import 'package:ui/theme/guttters.dart' show Gutters;

class AssembleOverviewCards extends HookConsumerWidget {
  const AssembleOverviewCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(overviewStatisticsVMProvider);

    final cards = [
      OverviewCard(
        icon: Amicons.vuesax_3d_square_fill,
        title: 'Jumlah item',
        titleColor: CupertinoColors.systemGrey5,
        statNumberColor: CupertinoColors.systemGrey6,
        statNumber:
            vm.whenOrNull(data: (value) => value.totalItems.toString()) ?? '',
        iconBackgroundColor: CupertinoColors.systemGrey5,
        iconColor: CupertinoColors.systemIndigo,
        backgroundColor: CupertinoColors.systemIndigo,
        isLoading: vm.isLoading,
      ),
      OverviewCard(
        icon: Amicons.vuesax_clock_fill,
        title: 'Hampir tamat tempoh',
        statNumber: '10',
        iconBackgroundColor: AppColors.color2,
      ),
      OverviewCard(
        icon: Amicons.vuesax_3_square_fill,
        title: 'Perlu diservis',
        statNumber: '4',
        iconBackgroundColor: AppColors.color3,
      ),
      OverviewCard(
        icon: Amicons.vuesax_3_square_fill,
        title: 'Perlu diservis',
        statNumber: '4',
        iconBackgroundColor: AppColors.color3,
      ),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: Gutters.md,
      crossAxisSpacing: Gutters.md,
      childAspectRatio: 2.3,
      padding: const EdgeInsets.symmetric(
        horizontal: Gutters.md,
        vertical: Gutters.sm,
      ),
      children: cards,
    );
  }
}
