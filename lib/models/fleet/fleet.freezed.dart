// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fleet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Fleet _$FleetFromJson(Map<String, dynamic> json) {
  return _Fleet.fromJson(json);
}

/// @nodoc
mixin _$Fleet {
  String get id => throw _privateConstructorUsedError;
  String get truckName => throw _privateConstructorUsedError;
  String get truckPlate => throw _privateConstructorUsedError;
  String get truckType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  Map<String, dynamic> get location => throw _privateConstructorUsedError;

  /// Serializes this Fleet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Fleet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FleetCopyWith<Fleet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FleetCopyWith<$Res> {
  factory $FleetCopyWith(Fleet value, $Res Function(Fleet) then) =
      _$FleetCopyWithImpl<$Res, Fleet>;
  @useResult
  $Res call(
      {String id,
      String truckName,
      String truckPlate,
      String truckType,
      String status,
      Map<String, dynamic> location});
}

/// @nodoc
class _$FleetCopyWithImpl<$Res, $Val extends Fleet>
    implements $FleetCopyWith<$Res> {
  _$FleetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Fleet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? truckName = null,
    Object? truckPlate = null,
    Object? truckType = null,
    Object? status = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      truckName: null == truckName
          ? _value.truckName
          : truckName // ignore: cast_nullable_to_non_nullable
              as String,
      truckPlate: null == truckPlate
          ? _value.truckPlate
          : truckPlate // ignore: cast_nullable_to_non_nullable
              as String,
      truckType: null == truckType
          ? _value.truckType
          : truckType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FleetImplCopyWith<$Res> implements $FleetCopyWith<$Res> {
  factory _$$FleetImplCopyWith(
          _$FleetImpl value, $Res Function(_$FleetImpl) then) =
      __$$FleetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String truckName,
      String truckPlate,
      String truckType,
      String status,
      Map<String, dynamic> location});
}

/// @nodoc
class __$$FleetImplCopyWithImpl<$Res>
    extends _$FleetCopyWithImpl<$Res, _$FleetImpl>
    implements _$$FleetImplCopyWith<$Res> {
  __$$FleetImplCopyWithImpl(
      _$FleetImpl _value, $Res Function(_$FleetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Fleet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? truckName = null,
    Object? truckPlate = null,
    Object? truckType = null,
    Object? status = null,
    Object? location = null,
  }) {
    return _then(_$FleetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      truckName: null == truckName
          ? _value.truckName
          : truckName // ignore: cast_nullable_to_non_nullable
              as String,
      truckPlate: null == truckPlate
          ? _value.truckPlate
          : truckPlate // ignore: cast_nullable_to_non_nullable
              as String,
      truckType: null == truckType
          ? _value.truckType
          : truckType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FleetImpl implements _Fleet {
  const _$FleetImpl(
      {required this.id,
      required this.truckName,
      required this.truckPlate,
      required this.truckType,
      required this.status,
      required final Map<String, dynamic> location})
      : _location = location;

  factory _$FleetImpl.fromJson(Map<String, dynamic> json) =>
      _$$FleetImplFromJson(json);

  @override
  final String id;
  @override
  final String truckName;
  @override
  final String truckPlate;
  @override
  final String truckType;
  @override
  final String status;
  final Map<String, dynamic> _location;
  @override
  Map<String, dynamic> get location {
    if (_location is EqualUnmodifiableMapView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_location);
  }

  @override
  String toString() {
    return 'Fleet(id: $id, truckName: $truckName, truckPlate: $truckPlate, truckType: $truckType, status: $status, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FleetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.truckName, truckName) ||
                other.truckName == truckName) &&
            (identical(other.truckPlate, truckPlate) ||
                other.truckPlate == truckPlate) &&
            (identical(other.truckType, truckType) ||
                other.truckType == truckType) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._location, _location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, truckName, truckPlate,
      truckType, status, const DeepCollectionEquality().hash(_location));

  /// Create a copy of Fleet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FleetImplCopyWith<_$FleetImpl> get copyWith =>
      __$$FleetImplCopyWithImpl<_$FleetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FleetImplToJson(
      this,
    );
  }
}

abstract class _Fleet implements Fleet {
  const factory _Fleet(
      {required final String id,
      required final String truckName,
      required final String truckPlate,
      required final String truckType,
      required final String status,
      required final Map<String, dynamic> location}) = _$FleetImpl;

  factory _Fleet.fromJson(Map<String, dynamic> json) = _$FleetImpl.fromJson;

  @override
  String get id;
  @override
  String get truckName;
  @override
  String get truckPlate;
  @override
  String get truckType;
  @override
  String get status;
  @override
  Map<String, dynamic> get location;

  /// Create a copy of Fleet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FleetImplCopyWith<_$FleetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
