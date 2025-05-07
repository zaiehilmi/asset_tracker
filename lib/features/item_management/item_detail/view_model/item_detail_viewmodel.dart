import 'package:june/june.dart';
import 'package:ui/database/tables/items/item.dart' show Item;
import 'package:ui/database/tables/items/item_repository.dart'
    show ItemRepository;
import 'package:ui/utils/june_mixin.dart';

final itemDetailState = June.getState(ItemDetailVM.new);

class ItemDetailVM extends JuneState with JuneCustomMixin {
  Item? item;

  Future<void> fetchItem(String id) async {
    resetLoading();
    item = await ItemRepository().readById(id);
    setStateAsync();
  }
}
