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
      nota: _item!.notes,
      usiaItem: _item!.purchaseDate.berbandingSekarang,
      kodbarDidaftarkan: _item!.barcode != null,
      terakhirDikemaskini: _item!.lastUpdatedDate.berbandingSekarang,
      harga:
          (_item?.price != null)
              ? 'RM ${_item!.price!.toStringAsFixed(2)}'
              : null,
      tarikhPemilikan:
          '${_item!.purchaseDate.tarikhNumeral} ${_item!.purchaseDate.berbandingSekarang}',
      tarikhLuput:
          _item!.expiryDate != null
              ? '${_item!.expiryDate.tarikhNumeral} ${_item!.expiryDate.berbandingSekarang}'
              : null,
      sumber: _item!.source?.toDisplay(),
      kategori: _item!.category?.toDisplay(),
      status: _item!.status?.toDisplay(),
      pautan: _item!.urlLink,
    );

    setStateAsync();
  }
}
