import 'package:june/june.dart';
import 'package:roggle/roggle.dart';
import 'package:ui/database/tables/tables.dart';
import 'package:ui/utils/june_mixin.dart' show JuneCustomMixin;
import 'package:ui/utils/logger.dart' show logger;

final overviewStatisticsState = June.getState(OverviewStatisticsVM.new);

class OverviewStatisticsVM extends JuneState with JuneCustomMixin {
  int? totalItems;
  int? totalNearExpiryItems;
  int? totalNeedServiceItems;

  Future<void> fetchTotalItems() async {
    resetLoading();

    final items = await ItemRepository().readAll();
    logger.log(Level.info, 'saiz item ${items.length}');

    totalItems = items.length;
    setStateAsync();
  }

  Future<void> fetchTotalNearExpiryItems() async {
    resetLoading();
    // final items = await ItemRepository().readAll();
    // logger.log(Level.info,'saiz item ${items.length}');
    // totalNearExpiryItems = items.length;
    setStateAsync();
  }

  Future<void> fetchTotalNeedServiceItems() async {
    resetLoading();
    // final items = await ItemRepository().readAll();
    // logger.log(Level.info,'saiz item ${items.length}');
    // totalNeedServiceItems = items.length;
    setStateAsync();
  }
}
