import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_item_state.freezed.dart';
part 'add_item_state.g.dart';

@freezed
sealed class AddItemState with _$AddItemState {
  const factory AddItemState({
    @Default(null) String? nama,
    @Default(null) String? huraian,
    @Default(null) String? sumber,
    @Default(null) String? harga,
    @Default(null) String? kategori,
    @Default(null) String? status,
    @Default(null) String? pautan,
    DateTime? tarikhPembelian,
    DateTime? tarikhLuput,

    @Default([]) List<String> senaraiSumber,
    @Default([]) List<String> senaraiKategori,
    @Default([]) List<String> senaraiStatus,
  }) = _AddItemState;

  factory AddItemState.fromJson(Map<String, dynamic> json) =>
      _$AddItemStateFromJson(json);
}
