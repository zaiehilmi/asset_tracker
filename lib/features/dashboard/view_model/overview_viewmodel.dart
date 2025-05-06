import 'package:june/june.dart';
import 'package:roggle/roggle.dart';
import 'package:ui/database/tables/tables.dart';
import 'package:ui/utils/logger.dart' show logger;

final overviewStatisticsVMState = June.getState(OverviewStatisticsVM.new);

class OverviewStatisticsVM extends JuneState {
  int? totalItems;
  int? totalNearExpiryItems;
  int? totalNeedServiceItems;

  Future<void> fetchTotalItems() async {
    final items = await ItemRepository().readAll();
    logger.log(Level.info, 'saiz item ${items.length}');

    totalItems = items.length;
    setState();
  }

  Future<void> fetchTotalNearExpiryItems() async {
    // final items = await ItemRepository().readAll();
    // logger.log(Level.info,'saiz item ${items.length}');
    // totalNearExpiryItems = items.length;
    setState();
  }

  Future<void> fetchTotalNeedServiceItems() async {
    // final items = await ItemRepository().readAll();
    // logger.log(Level.info,'saiz item ${items.length}');
    // totalNeedServiceItems = items.length;
    setState();
  }
}
