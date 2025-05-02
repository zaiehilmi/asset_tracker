import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/features/dashboard/view_model/overview_viewmodel.dart';
import 'package:ui/features/dashboard/widgets/_overview_card.dart';
import 'package:ui/theme/color.dart';
import 'package:ui/theme/guttters.dart';

class AssembleOverviewCards extends HookConsumerWidget {
  const AssembleOverviewCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const sizeBetweenCard = Gutters.md;
    final vm = ref.watch(overviewStatisticsVMProvider);

    return IntrinsicHeight(
      child: Row(
        spacing: sizeBetweenCard,
        children: [
          Expanded(
            child: OverviewCard(
              icon: Amicons.vuesax_3d_square_fill,
              title: 'Jumlah item',
              subTitle:
                  vm.whenOrNull(data: (value) => value.totalItems.toString()) ??
                  '',
              spaceBetweenTitleAndSubTitle: MainAxisAlignment.spaceBetween,
              subTitleFontSize: 40,
              titleFontSize: 20,
              iconColor: CupertinoColors.systemIndigo,
              isLoading: vm.isLoading,
            ),
          ),
          Expanded(
            child: Column(
              spacing: sizeBetweenCard,
              children: [
                OverviewCard(
                  icon: Amicons.vuesax_clock_fill,
                  title: 'Hampir tamat tempoh',
                  subTitle: '10',
                  iconColor: AppColors.color2,
                ),
                OverviewCard(
                  icon: Amicons.vuesax_3_square_fill,
                  title: 'Perlu diservis',
                  subTitle: '4',
                  iconColor: AppColors.color3,
                ),
                OverviewCard(
                  icon: Amicons.vuesax_3_square_fill,
                  title: 'Perlu diservis',
                  subTitle: '4',
                  iconColor: AppColors.color3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
