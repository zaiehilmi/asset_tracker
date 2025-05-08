import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:june/june.dart';
import 'package:ui/features/item_management/item_detail/view_model/item_detail_viewmodel.dart';
import 'package:ui/utils/logger.dart';

class ItemDetailScreen extends HookWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      logger.d(itemDetailState.item?.name);
      return null;
    }, []);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoButton(
          child: Icon(Amicons.vuesax_edit),
          onPressed: () {},
        ),
      ),
      child: JuneBuilder(
        ItemDetailVM.new,
        builder: (vm) => ListView(children: [Text(vm.item?.name ?? '')]),
      ),
    );
  }
}
