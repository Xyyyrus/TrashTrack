// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Analysis _$AnalysisFromJson(Map<String, dynamic> json) {
  return _Analysis.fromJson(json);
}

/// @nodoc
mixin _$Analysis {
  String get id => throw _privateConstructorUsedError;
  String get kiloGram => throw _privateConstructorUsedError;
  String get cubicMeter => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get date => throw _privateConstructorUsedError;

  /// Serializes this Analysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Analysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisCopyWith<Analysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisCopyWith<$Res> {
  factory $AnalysisCopyWith(Analysis value, $Res Function(Analysis) then) =
      _$AnalysisCopyWithImpl<$Res, Analysis>;
  @useResult
  $Res call(
      {String id,
      String kiloGram,
      String cubicMeter,
      @TimestampConverter() Timestamp date});
}

/// @nodoc
class _$AnalysisCopyWithImpl<$Res, $Val extends Analysis>
    implements $AnalysisCopyWith<$Res> {
  _$AnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Analysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kiloGram = null,
    Object? cubicMeter = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      kiloGram: null == kiloGram
          ? _value.kiloGram
          : kiloGram // ignore: cast_nullable_to_non_nullable
              as String,
      cubicMeter: null == cubicMeter
          ? _value.cubicMeter
          : cubicMeter // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalysisImplCopyWith<$Res>
    implements $AnalysisCopyWith<$Res> {
  factory _$$AnalysisImplCopyWith(
          _$AnalysisImpl value, $Res Function(_$AnalysisImpl) then) =
      __$$AnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String kiloGram,
      String cubicMeter,
      @TimestampConverter() Timestamp date});
}

/// @nodoc
class __$$AnalysisImplCopyWithImpl<$Res>
    extends _$AnalysisCopyWithImpl<$Res, _$AnalysisImpl>
    implements _$$AnalysisImplCopyWith<$Res> {
  __$$AnalysisImplCopyWithImpl(
      _$AnalysisImpl _value, $Res Function(_$AnalysisImpl) _then)
      : super(_value, _then);

  /// Create a copy of Analysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kiloGram = null,
    Object? cubicMeter = null,
    Object? date = null,
  }) {
    return _then(_$AnalysisImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      kiloGram: null == kiloGram
          ? _value.kiloGram
          : kiloGram // ignore: cast_nullable_to_non_nullable
              as String,
      cubicMeter: null == cubicMeter
          ? _value.cubicMeter
          : cubicMeter // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalysisImpl implements _Analysis {
  const _$AnalysisImpl(
      {required this.id,
      required this.kiloGram,
      required this.cubicMeter,
      @TimestampConverter() required this.date});

  factory _$AnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisImplFromJson(json);

  @override
  final String id;
  @override
  final String kiloGram;
  @override
  final String cubicMeter;
  @override
  @TimestampConverter()
  final Timestamp date;

  @override
  String toString() {
    return 'Analysis(id: $id, kiloGram: $kiloGram, cubicMeter: $cubicMeter, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kiloGram, kiloGram) ||
                other.kiloGram == kiloGram) &&
            (identical(other.cubicMeter, cubicMeter) ||
                other.cubicMeter == cubicMeter) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, kiloGram, cubicMeter, date);

  /// Create a copy of Analysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisImplCopyWith<_$AnalysisImpl> get copyWith =>
      __$$AnalysisImplCopyWithImpl<_$AnalysisImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisImplToJson(
      this,
    );
  }
}

abstract class _Analysis implements Analysis {
  const factory _Analysis(
      {required final String id,
      required final String kiloGram,
      required final String cubicMeter,
      @TimestampConverter() required final Timestamp date}) = _$AnalysisImpl;

  factory _Analysis.fromJson(Map<String, dynamic> json) =
      _$AnalysisImpl.fromJson;

  @override
  String get id;
  @override
  String get kiloGram;
  @override
  String get cubicMeter;
  @override
  @TimestampConverter()
  Timestamp get date;

  /// Create a copy of Analysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisImplCopyWith<_$AnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
