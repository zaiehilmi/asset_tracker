import 'package:riverpod/riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:roggle/roggle.dart';
import 'package:ui/database/tables/tables.dart';
import 'package:ui/features/dashboard/model/overview_model.dart';
import 'package:ui/utils/logger.dart' show logger;

part 'overview_viewmodel.g.dart';

@riverpod
Future<OverviewStatisticsModel> overviewStatisticsVM(Ref ref) async {
  final items = await ItemRepository().readAll();
  logger.log(Level.info, 'saiz item ${items.length}');

  return OverviewStatisticsModel(
    totalItems: items.length,
    totalNearExpiryItems: 0,
    totalNeedServiceItems: 0,
  );
}
