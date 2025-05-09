import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:june/june.dart';
import 'package:ui/features/item_management/item_detail/view_model/item_detail_viewmodel.dart';
import 'package:ui/theme/theme.dart' show Gutters;
import 'package:ui/utils/extension/buildcontext.dart';
import 'package:ui/utils/logger.dart';

class ItemDetailScreen extends HookWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      return null;
    }, []);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoButton(
          child: const Icon(Amicons.vuesax_edit),
          onPressed: () {},
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: JuneBuilder(
          ItemDetailVM.new,
          builder: (vm) {
            final model = vm.itemDetailModel;

            return ListView(
              padding: EdgeInsets.symmetric(horizontal: Gutters.md),
              children: [
                Text(
                  model.nama,
                  style: context.textTheme.navTitleTextStyle.copyWith(
                    fontSize: 30,
                  ),
                ),
                Text('Usia item: ${model.usiaItem}'),
                Text(model.terakhirDikemaskini),
              ],
            );
          },
        ),
      ),
    );
  }
}
