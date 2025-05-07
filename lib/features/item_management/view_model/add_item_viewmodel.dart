import 'package:june/june.dart';
import 'package:ui/database/enums/enums.dart';
import 'package:ui/database/exceptions/database_exception.dart';
import 'package:ui/database/tables/items/item.dart';
import 'package:ui/database/tables/items/item_repository.dart';
import 'package:ui/features/item_management/model/add_item_model.dart';
import 'package:ui/utils/june_mixin.dart';
import 'package:ui/utils/logger.dart';

final addItemState = June.getState(AddItemVM.new);

class AddItemVM extends JuneState with JuneCustomMixin {
  AddItemModel? model;

  final senaraiSumber =
      Source.values.map((value) => value.toDisplay()).toList();
  final senaraiKategori =
      Category.values.map((value) => value.toDisplay()).toList();
  final senaraiStatus =
      Status.values.map((value) => value.toDisplay()).toList();

  Future<bool> onSubmit() async {
    resetLoading();

    final item = Item(
      id: '',
      name: model!.nama,
      notes: model?.huraian,
      price:
          (model?.harga != null && model!.harga!.isNotEmpty)
              ? double.tryParse(model!.harga!)
              : null,
      urlLink: model?.pautan,
      source: model?.sumber != null ? Source.fromDisplay(model!.sumber!) : null,
      category:
          (model?.kategori != null && model!.kategori!.isNotEmpty)
              ? Category.fromDisplay(model!.kategori!)
              : null,
      status:
          (model?.status != null && model!.status!.isNotEmpty)
              ? Status.fromDisplay(model!.status!)
              : null,
      purchaseDate: model?.tarikhPembelian,
      expiryDate: model?.tarikhLuput,
      barcode: model?.kodbar,
    );

    logger.i('Item: ${item.toJsonString()}');

    try {
      // await ItemRepository().insert(item);
      setStateAsync();
      return true;
    } on DatabaseException catch (e) {
      logger.e('AddItemViewModel Error: $e');
      setStateAsync();
      return false;
    }
  }
}
