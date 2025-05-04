import 'package:flutter/cupertino.dart';

class CupertinoLocalizationsMs implements CupertinoLocalizations {
  const CupertinoLocalizationsMs();

  @override
  String get alertDialogLabel => 'Amaran';

  @override
  String get todayLabel => 'Hari Ini';

  @override
  String get copyButtonLabel => 'Salin';

  @override
  String get cutButtonLabel => 'Potong';

  @override
  String get pasteButtonLabel => 'Tampal';

  @override
  String get selectAllButtonLabel => 'Pilih Semua';

  @override
  String get modalBarrierDismissLabel => 'Tutup';

  @override
  String get searchTextFieldPlaceholderLabel => 'Cari';

  @override
  String datePickerHourSemanticsLabel(int hour) => '$hour jam';

  @override
  String datePickerMinuteSemanticsLabel(int minute) => '$minute minit';

  @override
  String datePickerYear(int yearIndex) => '$yearIndex';

  @override
  String datePickerMonth(int monthIndex) {
    const months = [
      'Januari',
      'Februari',
      'Mac',
      'April',
      'Mei',
      'Jun',
      'Julai',
      'Ogos',
      'September',
      'Oktober',
      'November',
      'Disember',
    ];
    return months[monthIndex - 1];
  }

  @override
  String datePickerDayOfMonth(int dayIndex, [int? maxDigits]) {
    if (maxDigits != null) {
      return dayIndex.toString().padLeft(maxDigits, '0');
    }
    return dayIndex.toString();
  }

  @override
  String datePickerMediumDate(DateTime date) =>
      '${date.day} ${datePickerMonth(date.month)} ${date.year}';

  @override
  String timerPickerHourLabel(int hour) => '$hour jam';

  @override
  String timerPickerMinuteLabel(int minute) => '$minute minit';

  @override
  String timerPickerSecondLabel(int second) => '$second saat';

  @override
  List<String> get timerPickerHourLabels => const ['jam', 'jam'];

  @override
  List<String> get timerPickerMinuteLabels => const ['minit', 'minit'];

  @override
  List<String> get timerPickerSecondLabels => const ['saat', 'saat'];

  @override
  String get noSpellCheckReplacementsLabel => 'Tiada cadangan';

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) =>
      'Tab $tabIndex dari $tabCount';

  @override
  String get anteMeridiemAbbreviation => 'PG';

  @override
  String get clearButtonLabel => 'Kosongkan';

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.dmy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String datePickerHour(int hour) => hour.toString().padLeft(2, '0');

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerStandaloneMonth(int monthIndex) =>
      datePickerMonth(monthIndex);

  @override
  String get lookUpButtonLabel => 'Cari';

  @override
  String get menuDismissLabel => 'Tutup menu';

  @override
  String get postMeridiemAbbreviation => 'PTG';

  @override
  String get searchWebButtonLabel => 'Cari di Web';

  @override
  String get shareButtonLabel => 'Kongsi';

  @override
  String timerPickerHour(int hour) => hour.toString().padLeft(2, '0');

  @override
  String timerPickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String timerPickerSecond(int second) => second.toString().padLeft(2, '0');
}

class CupertinoLocalizationsMsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const CupertinoLocalizationsMsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ms';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return const CupertinoLocalizationsMs();
  }

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<CupertinoLocalizations> old,
  ) => false;
}
