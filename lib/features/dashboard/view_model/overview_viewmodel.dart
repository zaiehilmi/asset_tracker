import 'package:june/june.dart';
import 'package:roggle/roggle.dart';
import 'package:ui/database/tables/tables.dart';
import 'package:ui/utils/june_mixin.dart';
import 'package:ui/utils/logger.dart' show logger;

final overviewStatisticsVMState = June.getState(OverviewStatisticsVM.new);

class OverviewStatisticsVM extends JuneState with JuneCustomMixin {
  int? totalItems;
  int? totalNearExpiryItems;
  int? totalNeedServiceItems;

  Future<void> fetchTotalItems() async {
    final items = await ItemRepository().readAll();
    logger.log(Level.info, 'saiz item ${items.length}');

    totalItems = items.length;
    setLoadingEnd();
  }

  Future<void> fetchTotalNearExpiryItems() async {
    // final items = await ItemRepository().readAll();
    // logger.log(Level.info,'saiz item ${items.length}');
    // totalNearExpiryItems = items.length;
    setLoadingEnd();
  }

  Future<void> fetchTotalNeedServiceItems() async {
    // final items = await ItemRepository().readAll();
    // logger.log(Level.info,'saiz item ${items.length}');
    // totalNeedServiceItems = items.length;
    setLoadingEnd();
  }
}
