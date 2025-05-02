enum Category {
  elektronik,
  perabot,
  makananMinuman,
  penjagaanTubuh,
  pakaian,
  kebersihan,
  alatTulis,
  ubat,
  pertukangan,
  baranganDapur,
  baranganSukan,
  baranganHaiwanPeliharaan;

  String toPostgres() => switch (this) {
    Category.elektronik => 'elektronik',
    Category.perabot => 'perabot',
    Category.makananMinuman => 'makanan_minuman',
    Category.penjagaanTubuh => 'penjagaan_tubuh',
    Category.pakaian => 'pakaian',
    Category.kebersihan => 'kebersihan',
    Category.alatTulis => 'alat_tulis',
    Category.ubat => 'ubat',
    Category.pertukangan => 'pertukangan',
    Category.baranganDapur => 'barangan_dapur',
    Category.baranganSukan => 'barangan_sukan',
    Category.baranganHaiwanPeliharaan => 'barangan_haiwan_peliharaan',
  };

  static Category fromPostgres(String value) => switch (value) {
    'elektronik' => Category.elektronik,
    'perabot' => Category.perabot,
    'makanan_minuman' => Category.makananMinuman,
    'penjagaan_tubuh' => Category.penjagaanTubuh,
    'pakaian' => Category.pakaian,
    'kebersihan' => Category.kebersihan,
    'alat_tulis' => Category.alatTulis,
    'ubat' => Category.ubat,
    'pertukangan' => Category.pertukangan,
    'barangan_dapur' => Category.baranganDapur,
    'barangan_sukan' => Category.baranganSukan,
    'barangan_haiwan_peliharaan' => Category.baranganHaiwanPeliharaan,
    _ => throw ArgumentError('Invalid category value: $value'),
  };

  String toDisplay() => switch (this) {
    Category.elektronik => 'Elektronik',
    Category.perabot => 'Perabot',
    Category.makananMinuman => 'Makanan & Minuman',
    Category.penjagaanTubuh => 'Penjagaan Tubuh',
    Category.pakaian => 'Pakaian',
    Category.kebersihan => 'Kebersihan',
    Category.alatTulis => 'Alat Tulis',
    Category.ubat => 'Ubat',
    Category.pertukangan => 'Pertukangan',
    Category.baranganDapur => 'Barangan Dapur',
    Category.baranganSukan => 'Barangan Sukan',
    Category.baranganHaiwanPeliharaan => 'Barangan Haiwan Peliharaan',
  };
}
