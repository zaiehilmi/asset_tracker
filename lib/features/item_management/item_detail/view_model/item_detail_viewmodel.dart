import 'package:june/june.dart';
import 'package:ui/database/tables/items/item.dart' show Item;
import 'package:ui/database/tables/items/item_repository.dart'
    show ItemRepository;
import 'package:ui/features/item_management/item_detail/model/item_detail_model.dart';
import 'package:ui/utils/extension/datetime.dart';
import 'package:ui/utils/june_mixin.dart';

final itemDetailState = June.getState(ItemDetailVM.new);

class ItemDetailVM extends JuneState with JuneCustomMixin {
  Item? _item;
  late ItemDetailModel itemDetailModel;

  Future<void> fetchItem(String id) async {
    resetLoading();
    _item = await ItemRepository().readById(id);

    itemDetailModel = ItemDetailModel(
      nama: _item!.name,
      usiaItem: _item!.addedDate.berbandingSekarang,
      terakhirDikemaskini: _item!.lastUpdatedDate.berbandingSekarang,
    );

    setStateAsync();
  }
}
