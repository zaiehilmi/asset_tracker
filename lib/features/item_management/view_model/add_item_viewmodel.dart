import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/database/enums/enums.dart';
import 'package:ui/database/tables/items/item.dart';
import 'package:ui/database/tables/items/item_repository.dart';
import 'package:ui/features/item_management/state/add_item_state.dart'
    show AddItemState;
import 'package:ui/utils/talker.dart';

part 'add_item_viewmodel.g.dart';

@riverpod
class AddItemViewModel extends _$AddItemViewModel {
  @override
  AddItemState build() {
    return const AddItemState();
  }

  void setNama(String value) => state = state.copyWith(nama: value);
  void setHuraian(String value) => state = state.copyWith(huraian: value);
  void setSumber(String value) => state = state.copyWith(sumber: value);
  void setHarga(String value) => state = state.copyWith(harga: value);
  void setKategori(String value) => state = state.copyWith(kategori: value);
  void setStatus(String value) => state = state.copyWith(status: value);
  void setTarikhPembelian(DateTime? value) =>
      state = state.copyWith(tarikhPembelian: value);
  void setTarikhLuput(DateTime? value) =>
      state = state.copyWith(tarikhLuput: value);

  final List<String> sourceListString =
      Source.values.map((value) => value.toDisplay()).toList();
  final List<String> categoryListString =
      Category.values.map((value) => value.toDisplay()).toList();
  final List<String> statusListString =
      Status.values.map((value) => value.toDisplay()).toList();

  Future<void> onSubmit() async {
    final item = Item(
      id: '',
      name: state.nama!,
      notes: state.huraian,
      price: state.harga != null ? double.parse(state.harga.toString()) : null,
      source: state.sumber != null ? Source.fromDisplay(state.sumber!) : null,
      category:
          state.kategori != null ? Category.fromDisplay(state.kategori!) : null,
      status: state.status != null ? Status.fromDisplay(state.status!) : null,
      purchaseDate: state.tarikhPembelian,
      expiryDate: state.tarikhLuput,
    );

    talker.info('Item: ${item.toJsonString()}');

    // await ItemRepository().insert(item);
  }
}
