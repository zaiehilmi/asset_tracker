import 'package:amicons/amicons.dart' show Amicons;
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:june/state_manager/state_manager.dart';
import 'package:ui/features/item_management/item_detail/view_model/item_detail_viewmodel.dart';
import 'package:ui/utils/extension/buildcontext.dart';

const _iconColor = CupertinoColors.systemGrey;

class HeaderDetail extends HookWidget {
  const HeaderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return JuneBuilder(
      ItemDetailVM.new,
      builder: (vm) {
        final model = vm.itemDetailModel;

        return CupertinoFormSection.insetGrouped(
          children: [
            CupertinoListTile(
              title: Text(
                model.nama,
                maxLines: 5,
                softWrap: true,
                style: context.textTheme.textStyle.copyWith(fontSize: 15),
              ),
            ),
            if (model.nota != null)
              CupertinoListTile(
                leading: Icon(
                  Amicons.vuesax_note_2_1,
                  color: _iconColor.withAlpha(180),
                ),
                title: Text(
                  model.nota!,
                  maxLines: 5,
                  softWrap: true,
                  style: context.textTheme.textStyle.copyWith(fontSize: 15),
                ),
              ),
          ],
        );
      },
    );
  }
}
