import 'package:amicons/amicons.dart' show Amicons;
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:june/june.dart';
import 'package:ui/features/dashboard/view_model/overview_viewmodel.dart';
import 'package:ui/features/dashboard/widgets/_overview_card.dart'
    show OverviewCard;
import 'package:ui/theme/color.dart' show AppColors;
import 'package:ui/theme/guttters.dart' show Gutters;
import 'package:ui/utils/extension/buildcontext.dart';

class AssembleOverviewCards extends HookWidget {
  const AssembleOverviewCards({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      overviewStatisticsState.fetchTotalItems();

      return null;
    }, []);

    final cards = [
      JuneBuilder(
        OverviewStatisticsVM.new,
        builder:
            (vm) => OverviewCard(
              icon: Amicons.vuesax_3d_square_fill,
              title: 'Semua',
              titleColor: CupertinoColors.systemGrey5,
              statNumberColor: CupertinoColors.systemGrey6,
              statNumber: vm.totalItems.toString(),
              iconBackgroundColor: CupertinoColors.systemGrey5,
              iconColor: context.primaryColor,
              backgroundColor: context.primaryColor,
              isLoading: vm.totalItems == null,
            ),
      ),
      const OverviewCard(
        icon: Amicons.vuesax_clock_fill,
        title: 'Hampir tamat tempoh',
        statNumber: '10',
        iconBackgroundColor: AppColors.color2,
      ),
      const OverviewCard(
        icon: Amicons.vuesax_3_square_fill,
        title: 'Perlu diservis',
        statNumber: '4',
        iconBackgroundColor: AppColors.color3,
      ),
      const OverviewCard(
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
