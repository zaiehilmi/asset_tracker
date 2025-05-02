// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OverviewStatisticsModel {

 int get totalItems; int get totalNearExpiryItems; int get totalNeedServiceItems;
/// Create a copy of OverviewStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverviewStatisticsModelCopyWith<OverviewStatisticsModel> get copyWith => _$OverviewStatisticsModelCopyWithImpl<OverviewStatisticsModel>(this as OverviewStatisticsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverviewStatisticsModel&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.totalNearExpiryItems, totalNearExpiryItems) || other.totalNearExpiryItems == totalNearExpiryItems)&&(identical(other.totalNeedServiceItems, totalNeedServiceItems) || other.totalNeedServiceItems == totalNeedServiceItems));
}


@override
int get hashCode => Object.hash(runtimeType,totalItems,totalNearExpiryItems,totalNeedServiceItems);

@override
String toString() {
  return 'OverviewStatisticsModel(totalItems: $totalItems, totalNearExpiryItems: $totalNearExpiryItems, totalNeedServiceItems: $totalNeedServiceItems)';
}


}

/// @nodoc
abstract mixin class $OverviewStatisticsModelCopyWith<$Res>  {
  factory $OverviewStatisticsModelCopyWith(OverviewStatisticsModel value, $Res Function(OverviewStatisticsModel) _then) = _$OverviewStatisticsModelCopyWithImpl;
@useResult
$Res call({
 int totalItems, int totalNearExpiryItems, int totalNeedServiceItems
});




}
/// @nodoc
class _$OverviewStatisticsModelCopyWithImpl<$Res>
    implements $OverviewStatisticsModelCopyWith<$Res> {
  _$OverviewStatisticsModelCopyWithImpl(this._self, this._then);

  final OverviewStatisticsModel _self;
  final $Res Function(OverviewStatisticsModel) _then;

/// Create a copy of OverviewStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalItems = null,Object? totalNearExpiryItems = null,Object? totalNeedServiceItems = null,}) {
  return _then(_self.copyWith(
totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,totalNearExpiryItems: null == totalNearExpiryItems ? _self.totalNearExpiryItems : totalNearExpiryItems // ignore: cast_nullable_to_non_nullable
as int,totalNeedServiceItems: null == totalNeedServiceItems ? _self.totalNeedServiceItems : totalNeedServiceItems // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _OverviewStatisticsModel implements OverviewStatisticsModel {
   _OverviewStatisticsModel({required this.totalItems, required this.totalNearExpiryItems, required this.totalNeedServiceItems});
  

@override final  int totalItems;
@override final  int totalNearExpiryItems;
@override final  int totalNeedServiceItems;

/// Create a copy of OverviewStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverviewStatisticsModelCopyWith<_OverviewStatisticsModel> get copyWith => __$OverviewStatisticsModelCopyWithImpl<_OverviewStatisticsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverviewStatisticsModel&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.totalNearExpiryItems, totalNearExpiryItems) || other.totalNearExpiryItems == totalNearExpiryItems)&&(identical(other.totalNeedServiceItems, totalNeedServiceItems) || other.totalNeedServiceItems == totalNeedServiceItems));
}


@override
int get hashCode => Object.hash(runtimeType,totalItems,totalNearExpiryItems,totalNeedServiceItems);

@override
String toString() {
  return 'OverviewStatisticsModel(totalItems: $totalItems, totalNearExpiryItems: $totalNearExpiryItems, totalNeedServiceItems: $totalNeedServiceItems)';
}


}

/// @nodoc
abstract mixin class _$OverviewStatisticsModelCopyWith<$Res> implements $OverviewStatisticsModelCopyWith<$Res> {
  factory _$OverviewStatisticsModelCopyWith(_OverviewStatisticsModel value, $Res Function(_OverviewStatisticsModel) _then) = __$OverviewStatisticsModelCopyWithImpl;
@override @useResult
$Res call({
 int totalItems, int totalNearExpiryItems, int totalNeedServiceItems
});




}
/// @nodoc
class __$OverviewStatisticsModelCopyWithImpl<$Res>
    implements _$OverviewStatisticsModelCopyWith<$Res> {
  __$OverviewStatisticsModelCopyWithImpl(this._self, this._then);

  final _OverviewStatisticsModel _self;
  final $Res Function(_OverviewStatisticsModel) _then;

/// Create a copy of OverviewStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalItems = null,Object? totalNearExpiryItems = null,Object? totalNeedServiceItems = null,}) {
  return _then(_OverviewStatisticsModel(
totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,totalNearExpiryItems: null == totalNearExpiryItems ? _self.totalNearExpiryItems : totalNearExpiryItems // ignore: cast_nullable_to_non_nullable
as int,totalNeedServiceItems: null == totalNeedServiceItems ? _self.totalNeedServiceItems : totalNeedServiceItems // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
