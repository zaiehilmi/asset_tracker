class ItemDetailModel {
  ItemDetailModel({
    required this.nama,
    required this.usiaItem,
    required this.terakhirDikemaskini,
    this.kodbarDidaftarkan = false,
    this.nota,
    this.harga,
    this.tarikhPemilikan,
    this.tarikhLuput,
    this.sumber,
    this.kategori,
    this.status,
    this.pautan,
  });

  String nama;
  String? nota;
  String? harga;
  String usiaItem;
  bool kodbarDidaftarkan;
  String terakhirDikemaskini;
  String? tarikhPemilikan;
  String? tarikhLuput;
  String? sumber;
  String? kategori;
  String? status;
  String? pautan;
}

class ParentItemDetailModel {
  ParentItemDetailModel({
    required this.nama,
    this.nota,
    this.harga,
    this.terakhirDipakai,
  });

  String nama;
  String? nota;
  String? harga;
  String? terakhirDipakai;
}

class LoanRecordOfItemModel {}

class MaintenanceRecordOfItemModel {}
