import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:june/state_manager/state_manager.dart';
import 'package:ui/features/item_management/item_detail/view_model/item_detail_viewmodel.dart';
import 'package:ui/theme/guttters.dart' show Gutters;
import 'package:ui/utils/extension/buildcontext.dart';

class BriefDetail extends HookWidget {
  const BriefDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return JuneBuilder(
      ItemDetailVM.new,
      builder: (vm) {
        final model = vm.itemDetailModel;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: Gutters.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                spacing: Gutters.xs,
                children: [
                  Text(
                    model.usiaItem,
                    style: context.textTheme.textStyle.copyWith(fontSize: 14),
                  ),
                  Text('Usia item', style: context.textTheme.tabLabelTextStyle),
                ],
              ),
              // Divider
              Container(
                height: 25,
                width: 1,
                color: CupertinoColors.systemGrey,
              ),

              Column(
                children: [
                  Icon(
                    CupertinoIcons.barcode,
                    color:
                        (model.kodbarDidaftarkan)
                            ? context.primaryColor
                            : CupertinoColors.inactiveGray,
                  ),
                  Text(
                    (model.kodbarDidaftarkan)
                        ? 'Telah didaftarkan'
                        : 'Tidak didaftarkan',
                    style: context.textTheme.tabLabelTextStyle,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
