import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:june/state_manager/state_manager.dart';
import 'package:ui/features/item_management/item_detail/view_model/item_detail_viewmodel.dart';

class BodyDetail extends HookWidget {
  const BodyDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return JuneBuilder(
      ItemDetailVM.new,
      builder: (vm) {
        final model = vm.itemDetailModel;

        return CupertinoFormSection.insetGrouped(
          children: [
            if (model.harga != null)
              CupertinoListTile(
                leading: Icon(
                  CupertinoIcons.money_dollar_circle_fill,
                  color: CupertinoColors.systemGreen.withAlpha(vm.alpha),
                ),
                title: Text(model.harga!),
              ),
            if (model.pautan != null)
              // rasanya tak perlu ada field dia tersendiri. letak je kat bawah
              CupertinoListTile(
                leading: Icon(
                  CupertinoIcons.link,
                  color: CupertinoColors.link.withAlpha(vm.alpha),
                ),
                title: Text(model.pautan!),
              ),
            if (model.kategori != null)
              CupertinoListTile(
                leading: Icon(
                  CupertinoIcons.tag_solid,
                  color: CupertinoColors.systemIndigo.withAlpha(vm.alpha),
                ),
                title: Text(model.kategori!),
              ),
            if (model.sumber != null)
              CupertinoListTile(
                leading: Icon(
                  CupertinoIcons.shopping_cart,
                  color: CupertinoColors.systemMint.withAlpha(vm.alpha),
                ),
                title: Text(model.sumber!),
              ),
            if (model.status != null)
              CupertinoListTile(
                leading: Icon(
                  Amicons.vuesax_status_fill,
                  color: CupertinoColors.systemOrange.withAlpha(vm.alpha),
                ),
                title: Text(model.status!),
              ),
          ],
        );
      },
    );
  }
}
