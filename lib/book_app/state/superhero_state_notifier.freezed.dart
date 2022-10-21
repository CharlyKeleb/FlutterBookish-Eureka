// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'superhero_state_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SuperHeroState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadInProgress,
    required TResult Function(List<SuperHero> superheroes) success,
    required TResult Function(bool? isConnectionError) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadInProgress,
    TResult? Function(List<SuperHero> superheroes)? success,
    TResult? Function(bool? isConnectionError)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadInProgress,
    TResult Function(List<SuperHero> superheroes)? success,
    TResult Function(bool? isConnectionError)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuperHeroStateStarted value) started,
    required TResult Function(SuperHeroStateLoadInProgress value)
        loadInProgress,
    required TResult Function(SuperHeroStateSuccess value) success,
    required TResult Function(SuperHeroStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuperHeroStateStarted value)? started,
    TResult? Function(SuperHeroStateLoadInProgress value)? loadInProgress,
    TResult? Function(SuperHeroStateSuccess value)? success,
    TResult? Function(SuperHeroStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuperHeroStateStarted value)? started,
    TResult Function(SuperHeroStateLoadInProgress value)? loadInProgress,
    TResult Function(SuperHeroStateSuccess value)? success,
    TResult Function(SuperHeroStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuperHeroStateCopyWith<$Res> {
  factory $SuperHeroStateCopyWith(
          SuperHeroState value, $Res Function(SuperHeroState) then) =
      _$SuperHeroStateCopyWithImpl<$Res, SuperHeroState>;
}

/// @nodoc
class _$SuperHeroStateCopyWithImpl<$Res, $Val extends SuperHeroState>
    implements $SuperHeroStateCopyWith<$Res> {
  _$SuperHeroStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuperHeroStateStartedCopyWith<$Res> {
  factory _$$SuperHeroStateStartedCopyWith(_$SuperHeroStateStarted value,
          $Res Function(_$SuperHeroStateStarted) then) =
      __$$SuperHeroStateStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuperHeroStateStartedCopyWithImpl<$Res>
    extends _$SuperHeroStateCopyWithImpl<$Res, _$SuperHeroStateStarted>
    implements _$$SuperHeroStateStartedCopyWith<$Res> {
  __$$SuperHeroStateStartedCopyWithImpl(_$SuperHeroStateStarted _value,
      $Res Function(_$SuperHeroStateStarted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuperHeroStateStarted implements SuperHeroStateStarted {
  const _$SuperHeroStateStarted();

  @override
  String toString() {
    return 'SuperHeroState.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuperHeroStateStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadInProgress,
    required TResult Function(List<SuperHero> superheroes) success,
    required TResult Function(bool? isConnectionError) error,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadInProgress,
    TResult? Function(List<SuperHero> superheroes)? success,
    TResult? Function(bool? isConnectionError)? error,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadInProgress,
    TResult Function(List<SuperHero> superheroes)? success,
    TResult Function(bool? isConnectionError)? error,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuperHeroStateStarted value) started,
    required TResult Function(SuperHeroStateLoadInProgress value)
        loadInProgress,
    required TResult Function(SuperHeroStateSuccess value) success,
    required TResult Function(SuperHeroStateError value) error,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuperHeroStateStarted value)? started,
    TResult? Function(SuperHeroStateLoadInProgress value)? loadInProgress,
    TResult? Function(SuperHeroStateSuccess value)? success,
    TResult? Function(SuperHeroStateError value)? error,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuperHeroStateStarted value)? started,
    TResult Function(SuperHeroStateLoadInProgress value)? loadInProgress,
    TResult Function(SuperHeroStateSuccess value)? success,
    TResult Function(SuperHeroStateError value)? error,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class SuperHeroStateStarted implements SuperHeroState {
  const factory SuperHeroStateStarted() = _$SuperHeroStateStarted;
}

/// @nodoc
abstract class _$$SuperHeroStateLoadInProgressCopyWith<$Res> {
  factory _$$SuperHeroStateLoadInProgressCopyWith(
          _$SuperHeroStateLoadInProgress value,
          $Res Function(_$SuperHeroStateLoadInProgress) then) =
      __$$SuperHeroStateLoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuperHeroStateLoadInProgressCopyWithImpl<$Res>
    extends _$SuperHeroStateCopyWithImpl<$Res, _$SuperHeroStateLoadInProgress>
    implements _$$SuperHeroStateLoadInProgressCopyWith<$Res> {
  __$$SuperHeroStateLoadInProgressCopyWithImpl(
      _$SuperHeroStateLoadInProgress _value,
      $Res Function(_$SuperHeroStateLoadInProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuperHeroStateLoadInProgress implements SuperHeroStateLoadInProgress {
  const _$SuperHeroStateLoadInProgress();

  @override
  String toString() {
    return 'SuperHeroState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuperHeroStateLoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadInProgress,
    required TResult Function(List<SuperHero> superheroes) success,
    required TResult Function(bool? isConnectionError) error,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadInProgress,
    TResult? Function(List<SuperHero> superheroes)? success,
    TResult? Function(bool? isConnectionError)? error,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadInProgress,
    TResult Function(List<SuperHero> superheroes)? success,
    TResult Function(bool? isConnectionError)? error,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuperHeroStateStarted value) started,
    required TResult Function(SuperHeroStateLoadInProgress value)
        loadInProgress,
    required TResult Function(SuperHeroStateSuccess value) success,
    required TResult Function(SuperHeroStateError value) error,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuperHeroStateStarted value)? started,
    TResult? Function(SuperHeroStateLoadInProgress value)? loadInProgress,
    TResult? Function(SuperHeroStateSuccess value)? success,
    TResult? Function(SuperHeroStateError value)? error,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuperHeroStateStarted value)? started,
    TResult Function(SuperHeroStateLoadInProgress value)? loadInProgress,
    TResult Function(SuperHeroStateSuccess value)? success,
    TResult Function(SuperHeroStateError value)? error,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class SuperHeroStateLoadInProgress implements SuperHeroState {
  const factory SuperHeroStateLoadInProgress() = _$SuperHeroStateLoadInProgress;
}

/// @nodoc
abstract class _$$SuperHeroStateSuccessCopyWith<$Res> {
  factory _$$SuperHeroStateSuccessCopyWith(_$SuperHeroStateSuccess value,
          $Res Function(_$SuperHeroStateSuccess) then) =
      __$$SuperHeroStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SuperHero> superheroes});
}

/// @nodoc
class __$$SuperHeroStateSuccessCopyWithImpl<$Res>
    extends _$SuperHeroStateCopyWithImpl<$Res, _$SuperHeroStateSuccess>
    implements _$$SuperHeroStateSuccessCopyWith<$Res> {
  __$$SuperHeroStateSuccessCopyWithImpl(_$SuperHeroStateSuccess _value,
      $Res Function(_$SuperHeroStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? superheroes = null,
  }) {
    return _then(_$SuperHeroStateSuccess(
      superheroes: null == superheroes
          ? _value._superheroes
          : superheroes // ignore: cast_nullable_to_non_nullable
              as List<SuperHero>,
    ));
  }
}

/// @nodoc

class _$SuperHeroStateSuccess implements SuperHeroStateSuccess {
  const _$SuperHeroStateSuccess({required final List<SuperHero> superheroes})
      : _superheroes = superheroes;

  final List<SuperHero> _superheroes;
  @override
  List<SuperHero> get superheroes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_superheroes);
  }

  @override
  String toString() {
    return 'SuperHeroState.success(superheroes: $superheroes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuperHeroStateSuccess &&
            const DeepCollectionEquality()
                .equals(other._superheroes, _superheroes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_superheroes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuperHeroStateSuccessCopyWith<_$SuperHeroStateSuccess> get copyWith =>
      __$$SuperHeroStateSuccessCopyWithImpl<_$SuperHeroStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadInProgress,
    required TResult Function(List<SuperHero> superheroes) success,
    required TResult Function(bool? isConnectionError) error,
  }) {
    return success(superheroes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadInProgress,
    TResult? Function(List<SuperHero> superheroes)? success,
    TResult? Function(bool? isConnectionError)? error,
  }) {
    return success?.call(superheroes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadInProgress,
    TResult Function(List<SuperHero> superheroes)? success,
    TResult Function(bool? isConnectionError)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(superheroes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuperHeroStateStarted value) started,
    required TResult Function(SuperHeroStateLoadInProgress value)
        loadInProgress,
    required TResult Function(SuperHeroStateSuccess value) success,
    required TResult Function(SuperHeroStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuperHeroStateStarted value)? started,
    TResult? Function(SuperHeroStateLoadInProgress value)? loadInProgress,
    TResult? Function(SuperHeroStateSuccess value)? success,
    TResult? Function(SuperHeroStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuperHeroStateStarted value)? started,
    TResult Function(SuperHeroStateLoadInProgress value)? loadInProgress,
    TResult Function(SuperHeroStateSuccess value)? success,
    TResult Function(SuperHeroStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuperHeroStateSuccess implements SuperHeroState {
  const factory SuperHeroStateSuccess(
      {required final List<SuperHero> superheroes}) = _$SuperHeroStateSuccess;

  List<SuperHero> get superheroes;
  @JsonKey(ignore: true)
  _$$SuperHeroStateSuccessCopyWith<_$SuperHeroStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuperHeroStateErrorCopyWith<$Res> {
  factory _$$SuperHeroStateErrorCopyWith(_$SuperHeroStateError value,
          $Res Function(_$SuperHeroStateError) then) =
      __$$SuperHeroStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({bool? isConnectionError});
}

/// @nodoc
class __$$SuperHeroStateErrorCopyWithImpl<$Res>
    extends _$SuperHeroStateCopyWithImpl<$Res, _$SuperHeroStateError>
    implements _$$SuperHeroStateErrorCopyWith<$Res> {
  __$$SuperHeroStateErrorCopyWithImpl(
      _$SuperHeroStateError _value, $Res Function(_$SuperHeroStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnectionError = freezed,
  }) {
    return _then(_$SuperHeroStateError(
      isConnectionError: freezed == isConnectionError
          ? _value.isConnectionError
          : isConnectionError // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$SuperHeroStateError implements SuperHeroStateError {
  const _$SuperHeroStateError({this.isConnectionError});

  @override
  final bool? isConnectionError;

  @override
  String toString() {
    return 'SuperHeroState.error(isConnectionError: $isConnectionError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuperHeroStateError &&
            (identical(other.isConnectionError, isConnectionError) ||
                other.isConnectionError == isConnectionError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnectionError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuperHeroStateErrorCopyWith<_$SuperHeroStateError> get copyWith =>
      __$$SuperHeroStateErrorCopyWithImpl<_$SuperHeroStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() loadInProgress,
    required TResult Function(List<SuperHero> superheroes) success,
    required TResult Function(bool? isConnectionError) error,
  }) {
    return error(isConnectionError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? loadInProgress,
    TResult? Function(List<SuperHero> superheroes)? success,
    TResult? Function(bool? isConnectionError)? error,
  }) {
    return error?.call(isConnectionError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? loadInProgress,
    TResult Function(List<SuperHero> superheroes)? success,
    TResult Function(bool? isConnectionError)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(isConnectionError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuperHeroStateStarted value) started,
    required TResult Function(SuperHeroStateLoadInProgress value)
        loadInProgress,
    required TResult Function(SuperHeroStateSuccess value) success,
    required TResult Function(SuperHeroStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuperHeroStateStarted value)? started,
    TResult? Function(SuperHeroStateLoadInProgress value)? loadInProgress,
    TResult? Function(SuperHeroStateSuccess value)? success,
    TResult? Function(SuperHeroStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuperHeroStateStarted value)? started,
    TResult Function(SuperHeroStateLoadInProgress value)? loadInProgress,
    TResult Function(SuperHeroStateSuccess value)? success,
    TResult Function(SuperHeroStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SuperHeroStateError implements SuperHeroState {
  const factory SuperHeroStateError({final bool? isConnectionError}) =
      _$SuperHeroStateError;

  bool? get isConnectionError;
  @JsonKey(ignore: true)
  _$$SuperHeroStateErrorCopyWith<_$SuperHeroStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
