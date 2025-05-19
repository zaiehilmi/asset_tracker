import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:june/state_manager/state_manager.dart';
import 'package:ui/features/item_management/item_detail/view_model/item_detail_viewmodel.dart';
import 'package:ui/utils/extension/buildcontext.dart';

class BodyDetail extends HookWidget {
  const BodyDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return JuneBuilder(
      ItemDetailVM.new,
      builder: (vm) {
        final model = vm.itemDetailModel;

        return CupertinoFormSection.insetGrouped(
          children: List<Widget>.from(
            [
              _listTile(
                context,
                leadingIcon: CupertinoIcons.money_dollar,
                title: model.harga,
              ),
              _listTile(
                context,
                leadingIcon: CupertinoIcons.link,
                title: model.pautan,
              ),
              _listTile(
                context,
                leadingIcon: CupertinoIcons.tag,
                title: model.kategori,
              ),
              _listTile(
                context,
                leadingIcon: CupertinoIcons.shopping_cart,
                title:
                    (model.sumber != null)
                        ? 'diperoleh dari ${model.sumber!.toLowerCase()}'
                        : null,
              ),
              _listTile(
                context,
                leadingIcon: Amicons.vuesax_status,
                title:
                    (model.status != null)
                        ? 'kini ${model.status!.toLowerCase()}'
                        : null,
              ),
            ].where((widget) => widget != null),
          ),
        );
      },
    );
  }

  Widget? _listTile(
    BuildContext context, {
    required IconData leadingIcon,
    required String? title,
    Widget? trailing,
  }) {
    if (title != null) {
      return CupertinoListTile(
        leading: Icon(
          leadingIcon,
          size: 20,
          color: CupertinoColors.systemFill.withAlpha(150),
        ),
        title: Text(
          title,
          style: context.textTheme.textStyle.copyWith(fontSize: 14),
        ),
        trailing: trailing,
      );
    }

    return null;
  }
}
