class AddItemModel {
  const AddItemModel({
    required this.nama,
    this.huraian,
    this.sumber,
    this.harga,
    this.kategori,
    this.status,
    this.pautan,
    this.tarikhPembelian,
    this.tarikhLuput,
    this.kodbar,
  });

  final String nama;
  final String? huraian;
  final String? sumber;
  final String? harga;
  final String? kategori;
  final String? status;
  final String? pautan;
  final DateTime? tarikhPembelian;
  final DateTime? tarikhLuput;
  final String? kodbar;
}
