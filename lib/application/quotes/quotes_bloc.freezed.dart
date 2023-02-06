// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuotesState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<Failure, Quotes>> get failureOrResponseOption =>
      throw _privateConstructorUsedError;
  Option<QuoteAction>? get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuotesStateCopyWith<QuotesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotesStateCopyWith<$Res> {
  factory $QuotesStateCopyWith(
          QuotesState value, $Res Function(QuotesState) then) =
      _$QuotesStateCopyWithImpl<$Res, QuotesState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<Failure, Quotes>> failureOrResponseOption,
      Option<QuoteAction>? action});
}

/// @nodoc
class _$QuotesStateCopyWithImpl<$Res, $Val extends QuotesState>
    implements $QuotesStateCopyWith<$Res> {
  _$QuotesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrResponseOption = null,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrResponseOption: null == failureOrResponseOption
          ? _value.failureOrResponseOption
          : failureOrResponseOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Quotes>>,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as Option<QuoteAction>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuotesStateCopyWith<$Res>
    implements $QuotesStateCopyWith<$Res> {
  factory _$$_QuotesStateCopyWith(
          _$_QuotesState value, $Res Function(_$_QuotesState) then) =
      __$$_QuotesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<Failure, Quotes>> failureOrResponseOption,
      Option<QuoteAction>? action});
}

/// @nodoc
class __$$_QuotesStateCopyWithImpl<$Res>
    extends _$QuotesStateCopyWithImpl<$Res, _$_QuotesState>
    implements _$$_QuotesStateCopyWith<$Res> {
  __$$_QuotesStateCopyWithImpl(
      _$_QuotesState _value, $Res Function(_$_QuotesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrResponseOption = null,
    Object? action = freezed,
  }) {
    return _then(_$_QuotesState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrResponseOption: null == failureOrResponseOption
          ? _value.failureOrResponseOption
          : failureOrResponseOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Quotes>>,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as Option<QuoteAction>?,
    ));
  }
}

/// @nodoc

class _$_QuotesState implements _QuotesState {
  const _$_QuotesState(
      {required this.isLoading,
      required this.failureOrResponseOption,
      required this.action});

  @override
  final bool isLoading;
  @override
  final Option<Either<Failure, Quotes>> failureOrResponseOption;
  @override
  final Option<QuoteAction>? action;

  @override
  String toString() {
    return 'QuotesState(isLoading: $isLoading, failureOrResponseOption: $failureOrResponseOption, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuotesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(
                    other.failureOrResponseOption, failureOrResponseOption) ||
                other.failureOrResponseOption == failureOrResponseOption) &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, failureOrResponseOption, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuotesStateCopyWith<_$_QuotesState> get copyWith =>
      __$$_QuotesStateCopyWithImpl<_$_QuotesState>(this, _$identity);
}

abstract class _QuotesState implements QuotesState {
  const factory _QuotesState(
      {required final bool isLoading,
      required final Option<Either<Failure, Quotes>> failureOrResponseOption,
      required final Option<QuoteAction>? action}) = _$_QuotesState;

  @override
  bool get isLoading;
  @override
  Option<Either<Failure, Quotes>> get failureOrResponseOption;
  @override
  Option<QuoteAction>? get action;
  @override
  @JsonKey(ignore: true)
  _$$_QuotesStateCopyWith<_$_QuotesState> get copyWith =>
      throw _privateConstructorUsedError;
}
