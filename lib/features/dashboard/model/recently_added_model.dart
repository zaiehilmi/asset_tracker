import 'package:freezed_annotation/freezed_annotation.dart';

part 'recently_added_model.freezed.dart';

@freezed
abstract class RecentlyAddedModel with _$RecentlyAddedModel {
  factory RecentlyAddedModel({
    required String id,
    required String itemName,
    String? description,
    String? addedAge,
  }) = _RecentlyAddedModel;
}
