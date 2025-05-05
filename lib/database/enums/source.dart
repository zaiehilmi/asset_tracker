enum Source {
  atasTalian,
  kedaiFizikal,
  hadiah,
  terpakai;

  String toPostgres() => switch (this) {
    Source.atasTalian => 'atas_talian',
    Source.kedaiFizikal => 'kedai_fizikal',
    Source.hadiah => 'hadiah',
    Source.terpakai => 'terpakai',
  };

  static Source fromPostgres(String value) => switch (value) {
    'atas_talian' => Source.atasTalian,
    'kedai_fizikal' => Source.kedaiFizikal,
    'hadiah' => Source.hadiah,
    'terpakai' => Source.terpakai,
    _ => throw ArgumentError('Invalid source value: $value'),
  };

  String toDisplay() => switch (this) {
    Source.atasTalian => 'Atas Talian',
    Source.kedaiFizikal => 'Kedai Fizikal',
    Source.hadiah => 'Hadiah',
    Source.terpakai => 'Terpakai',
  };

  static Source fromDisplay(String value) {
    return Source.values.firstWhere(
      (source) => source.toDisplay() == value,
      orElse:
          () => throw ArgumentError('Nilai paparan sumber tidak sah: $value'),
    );
  }
}
