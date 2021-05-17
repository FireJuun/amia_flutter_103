// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginServiceTearOff {
  const _$LoginServiceTearOff();

  _LoginBasic loginBasic({required Rx<RemoteState<dynamic>> state}) {
    return _LoginBasic(
      state: state,
    );
  }

  _LoginFirebase loginFirebase({required Rx<RemoteState<dynamic>> state}) {
    return _LoginFirebase(
      state: state,
    );
  }

  _LoginGoogle loginGoogle({required Rx<RemoteState<dynamic>> state}) {
    return _LoginGoogle(
      state: state,
    );
  }
}

/// @nodoc
const $LoginService = _$LoginServiceTearOff();

/// @nodoc
mixin _$LoginService {
  Rx<RemoteState<dynamic>> get state => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Rx<RemoteState<dynamic>> state) loginBasic,
    required TResult Function(Rx<RemoteState<dynamic>> state) loginFirebase,
    required TResult Function(Rx<RemoteState<dynamic>> state) loginGoogle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Rx<RemoteState<dynamic>> state)? loginBasic,
    TResult Function(Rx<RemoteState<dynamic>> state)? loginFirebase,
    TResult Function(Rx<RemoteState<dynamic>> state)? loginGoogle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginBasic value) loginBasic,
    required TResult Function(_LoginFirebase value) loginFirebase,
    required TResult Function(_LoginGoogle value) loginGoogle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginBasic value)? loginBasic,
    TResult Function(_LoginFirebase value)? loginFirebase,
    TResult Function(_LoginGoogle value)? loginGoogle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginServiceCopyWith<LoginService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginServiceCopyWith<$Res> {
  factory $LoginServiceCopyWith(
          LoginService value, $Res Function(LoginService) then) =
      _$LoginServiceCopyWithImpl<$Res>;
  $Res call({Rx<RemoteState<dynamic>> state});
}

/// @nodoc
class _$LoginServiceCopyWithImpl<$Res> implements $LoginServiceCopyWith<$Res> {
  _$LoginServiceCopyWithImpl(this._value, this._then);

  final LoginService _value;
  // ignore: unused_field
  final $Res Function(LoginService) _then;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Rx<RemoteState<dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$LoginBasicCopyWith<$Res>
    implements $LoginServiceCopyWith<$Res> {
  factory _$LoginBasicCopyWith(
          _LoginBasic value, $Res Function(_LoginBasic) then) =
      __$LoginBasicCopyWithImpl<$Res>;
  @override
  $Res call({Rx<RemoteState<dynamic>> state});
}

/// @nodoc
class __$LoginBasicCopyWithImpl<$Res> extends _$LoginServiceCopyWithImpl<$Res>
    implements _$LoginBasicCopyWith<$Res> {
  __$LoginBasicCopyWithImpl(
      _LoginBasic _value, $Res Function(_LoginBasic) _then)
      : super(_value, (v) => _then(v as _LoginBasic));

  @override
  _LoginBasic get _value => super._value as _LoginBasic;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_LoginBasic(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Rx<RemoteState<dynamic>>,
    ));
  }
}

/// @nodoc

class _$_LoginBasic extends _LoginBasic {
  _$_LoginBasic({required this.state}) : super._();

  @override
  final Rx<RemoteState<dynamic>> state;

  @override
  String toString() {
    return 'LoginService.loginBasic(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginBasic &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(state);

  @JsonKey(ignore: true)
  @override
  _$LoginBasicCopyWith<_LoginBasic> get copyWith =>
      __$LoginBasicCopyWithImpl<_LoginBasic>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Rx<RemoteState<dynamic>> state) loginBasic,
    required TResult Function(Rx<RemoteState<dynamic>> state) loginFirebase,
    required TResult Function(Rx<RemoteState<dynamic>> state) loginGoogle,
  }) {
    return loginBasic(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Rx<RemoteState<dynamic>> state)? loginBasic,
    TResult Function(Rx<RemoteState<dynamic>> state)? loginFirebase,
    TResult Function(Rx<RemoteState<dynamic>> state)? loginGoogle,
    required TResult orElse(),
  }) {
    if (loginBasic != null) {
      return loginBasic(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginBasic value) loginBasic,
    required TResult Function(_LoginFirebase value) loginFirebase,
    required TResult Function(_LoginGoogle value) loginGoogle,
  }) {
    return loginBasic(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginBasic value)? loginBasic,
    TResult Function(_LoginFirebase value)? loginFirebase,
    TResult Function(_LoginGoogle value)? loginGoogle,
    required TResult orElse(),
  }) {
    if (loginBasic != null) {
      return loginBasic(this);
    }
    return orElse();
  }
}

abstract class _LoginBasic extends LoginService {
  factory _LoginBasic({required Rx<RemoteState<dynamic>> state}) =
      _$_LoginBasic;
  _LoginBasic._() : super._();

  @override
  Rx<RemoteState<dynamic>> get state => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginBasicCopyWith<_LoginBasic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoginFirebaseCopyWith<$Res>
    implements $LoginServiceCopyWith<$Res> {
  factory _$LoginFirebaseCopyWith(
          _LoginFirebase value, $Res Function(_LoginFirebase) then) =
      __$LoginFirebaseCopyWithImpl<$Res>;
  @override
  $Res call({Rx<RemoteState<dynamic>> state});
}

/// @nodoc
class __$LoginFirebaseCopyWithImpl<$Res>
    extends _$LoginServiceCopyWithImpl<$Res>
    implements _$LoginFirebaseCopyWith<$Res> {
  __$LoginFirebaseCopyWithImpl(
      _LoginFirebase _value, $Res Function(_LoginFirebase) _then)
      : super(_value, (v) => _then(v as _LoginFirebase));

  @override
  _LoginFirebase get _value => super._value as _LoginFirebase;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_LoginFirebase(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Rx<RemoteState<dynamic>>,
    ));
  }
}

/// @nodoc

class _$_LoginFirebase extends _LoginFirebase {
  _$_LoginFirebase({required this.state}) : super._();

  @override
  final Rx<RemoteState<dynamic>> state;

  @override
  String toString() {
    return 'LoginService.loginFirebase(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginFirebase &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(state);

  @JsonKey(ignore: true)
  @override
  _$LoginFirebaseCopyWith<_LoginFirebase> get copyWith =>
      __$LoginFirebaseCopyWithImpl<_LoginFirebase>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Rx<RemoteState<dynamic>> state) loginBasic,
    required TResult Function(Rx<RemoteState<dynamic>> state) loginFirebase,
    required TResult Function(Rx<RemoteState<dynamic>> state) loginGoogle,
  }) {
    return loginFirebase(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Rx<RemoteState<dynamic>> state)? loginBasic,
    TResult Function(Rx<RemoteState<dynamic>> state)? loginFirebase,
    TResult Function(Rx<RemoteState<dynamic>> state)? loginGoogle,
    required TResult orElse(),
  }) {
    if (loginFirebase != null) {
      return loginFirebase(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginBasic value) loginBasic,
    required TResult Function(_LoginFirebase value) loginFirebase,
    required TResult Function(_LoginGoogle value) loginGoogle,
  }) {
    return loginFirebase(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginBasic value)? loginBasic,
    TResult Function(_LoginFirebase value)? loginFirebase,
    TResult Function(_LoginGoogle value)? loginGoogle,
    required TResult orElse(),
  }) {
    if (loginFirebase != null) {
      return loginFirebase(this);
    }
    return orElse();
  }
}

abstract class _LoginFirebase extends LoginService {
  factory _LoginFirebase({required Rx<RemoteState<dynamic>> state}) =
      _$_LoginFirebase;
  _LoginFirebase._() : super._();

  @override
  Rx<RemoteState<dynamic>> get state => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginFirebaseCopyWith<_LoginFirebase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoginGoogleCopyWith<$Res>
    implements $LoginServiceCopyWith<$Res> {
  factory _$LoginGoogleCopyWith(
          _LoginGoogle value, $Res Function(_LoginGoogle) then) =
      __$LoginGoogleCopyWithImpl<$Res>;
  @override
  $Res call({Rx<RemoteState<dynamic>> state});
}

/// @nodoc
class __$LoginGoogleCopyWithImpl<$Res> extends _$LoginServiceCopyWithImpl<$Res>
    implements _$LoginGoogleCopyWith<$Res> {
  __$LoginGoogleCopyWithImpl(
      _LoginGoogle _value, $Res Function(_LoginGoogle) _then)
      : super(_value, (v) => _then(v as _LoginGoogle));

  @override
  _LoginGoogle get _value => super._value as _LoginGoogle;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_LoginGoogle(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Rx<RemoteState<dynamic>>,
    ));
  }
}

/// @nodoc

class _$_LoginGoogle extends _LoginGoogle {
  _$_LoginGoogle({required this.state}) : super._();

  @override
  final Rx<RemoteState<dynamic>> state;

  @override
  String toString() {
    return 'LoginService.loginGoogle(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginGoogle &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(state);

  @JsonKey(ignore: true)
  @override
  _$LoginGoogleCopyWith<_LoginGoogle> get copyWith =>
      __$LoginGoogleCopyWithImpl<_LoginGoogle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Rx<RemoteState<dynamic>> state) loginBasic,
    required TResult Function(Rx<RemoteState<dynamic>> state) loginFirebase,
    required TResult Function(Rx<RemoteState<dynamic>> state) loginGoogle,
  }) {
    return loginGoogle(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Rx<RemoteState<dynamic>> state)? loginBasic,
    TResult Function(Rx<RemoteState<dynamic>> state)? loginFirebase,
    TResult Function(Rx<RemoteState<dynamic>> state)? loginGoogle,
    required TResult orElse(),
  }) {
    if (loginGoogle != null) {
      return loginGoogle(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginBasic value) loginBasic,
    required TResult Function(_LoginFirebase value) loginFirebase,
    required TResult Function(_LoginGoogle value) loginGoogle,
  }) {
    return loginGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginBasic value)? loginBasic,
    TResult Function(_LoginFirebase value)? loginFirebase,
    TResult Function(_LoginGoogle value)? loginGoogle,
    required TResult orElse(),
  }) {
    if (loginGoogle != null) {
      return loginGoogle(this);
    }
    return orElse();
  }
}

abstract class _LoginGoogle extends LoginService {
  factory _LoginGoogle({required Rx<RemoteState<dynamic>> state}) =
      _$_LoginGoogle;
  _LoginGoogle._() : super._();

  @override
  Rx<RemoteState<dynamic>> get state => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginGoogleCopyWith<_LoginGoogle> get copyWith =>
      throw _privateConstructorUsedError;
}
