enum Status {
  tersedia,
  sedangDiguna,
  habisDiguna,
  rosak,
  dalamPembaikan,
  hilang,
  dilupuskan;

  String toPostgres() => switch (this) {
    Status.tersedia => 'tersedia',
    Status.sedangDiguna => 'sedang_diguna',
    Status.habisDiguna => 'habis_diguna',
    Status.rosak => 'rosak',
    Status.dalamPembaikan => 'dalam_pembaikan',
    Status.hilang => 'hilang',
    Status.dilupuskan => 'dilupuskan',
  };

  static Status fromPostgres(String value) => switch (value) {
    'tersedia' => Status.tersedia,
    'sedang_diguna' => Status.sedangDiguna,
    'habis_diguna' => Status.habisDiguna,
    'rosak' => Status.rosak,
    'dalam_pembaikan' => Status.dalamPembaikan,
    'hilang' => Status.hilang,
    'dilupuskan' => Status.dilupuskan,
    _ => throw ArgumentError('Nilai status tidak sah: $value'),
  };

  String toDisplay() => switch (this) {
    Status.tersedia => 'Tersedia',
    Status.sedangDiguna => 'Sedang Diguna',
    Status.habisDiguna => 'Habis Diguna',
    Status.rosak => 'Rosak',
    Status.dalamPembaikan => 'Dalam Pembaikan',
    Status.hilang => 'Hilang',
    Status.dilupuskan => 'Dilupuskan',
  };
}
