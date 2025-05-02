import 'package:freezed_annotation/freezed_annotation.dart';

part 'overview_model.freezed.dart';

@freezed
abstract class OverviewStatisticsModel with _$OverviewStatisticsModel {
  factory OverviewStatisticsModel({
    required int totalItems,
    required int totalNearExpiryItems,
    required int totalNeedServiceItems,
  }) = _OverviewStatisticsModel;
}
