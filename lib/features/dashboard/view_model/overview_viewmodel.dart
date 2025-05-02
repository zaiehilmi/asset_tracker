import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/database/tables/tables.dart';
import 'package:ui/features/dashboard/model/overview_model.dart';

part 'overview_viewmodel.g.dart';

@riverpod
Future<OverviewStatisticsModel> overviewStatisticsVM(Ref ref) async {
  final items = await ItemRepository().readAll();
  debugPrint('apa ni ${items.length}');

  return OverviewStatisticsModel(
    totalItems: items.length,
    totalNearExpiryItems: 0,
    totalNeedServiceItems: 0,
  );
}
