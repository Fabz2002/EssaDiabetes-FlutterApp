// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comida_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ComidaState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) message,
    required TResult Function(Comida data) loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? message,
    TResult? Function(Comida data)? loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? message,
    TResult Function(Comida data)? loadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialComida value) initial,
    required TResult Function(MessageGetComida value) message,
    required TResult Function(LoadSuccessGetComida value) loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialComida value)? initial,
    TResult? Function(MessageGetComida value)? message,
    TResult? Function(LoadSuccessGetComida value)? loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialComida value)? initial,
    TResult Function(MessageGetComida value)? message,
    TResult Function(LoadSuccessGetComida value)? loadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComidaStateCopyWith<$Res> {
  factory $ComidaStateCopyWith(
          ComidaState value, $Res Function(ComidaState) then) =
      _$ComidaStateCopyWithImpl<$Res, ComidaState>;
}

/// @nodoc
class _$ComidaStateCopyWithImpl<$Res, $Val extends ComidaState>
    implements $ComidaStateCopyWith<$Res> {
  _$ComidaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialComidaCopyWith<$Res> {
  factory _$$InitialComidaCopyWith(
          _$InitialComida value, $Res Function(_$InitialComida) then) =
      __$$InitialComidaCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialComidaCopyWithImpl<$Res>
    extends _$ComidaStateCopyWithImpl<$Res, _$InitialComida>
    implements _$$InitialComidaCopyWith<$Res> {
  __$$InitialComidaCopyWithImpl(
      _$InitialComida _value, $Res Function(_$InitialComida) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialComida implements InitialComida {
  const _$InitialComida();

  @override
  String toString() {
    return 'ComidaState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialComida);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) message,
    required TResult Function(Comida data) loadSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? message,
    TResult? Function(Comida data)? loadSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? message,
    TResult Function(Comida data)? loadSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialComida value) initial,
    required TResult Function(MessageGetComida value) message,
    required TResult Function(LoadSuccessGetComida value) loadSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialComida value)? initial,
    TResult? Function(MessageGetComida value)? message,
    TResult? Function(LoadSuccessGetComida value)? loadSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialComida value)? initial,
    TResult Function(MessageGetComida value)? message,
    TResult Function(LoadSuccessGetComida value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialComida implements ComidaState {
  const factory InitialComida() = _$InitialComida;
}

/// @nodoc
abstract class _$$MessageGetComidaCopyWith<$Res> {
  factory _$$MessageGetComidaCopyWith(
          _$MessageGetComida value, $Res Function(_$MessageGetComida) then) =
      __$$MessageGetComidaCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MessageGetComidaCopyWithImpl<$Res>
    extends _$ComidaStateCopyWithImpl<$Res, _$MessageGetComida>
    implements _$$MessageGetComidaCopyWith<$Res> {
  __$$MessageGetComidaCopyWithImpl(
      _$MessageGetComida _value, $Res Function(_$MessageGetComida) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MessageGetComida(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MessageGetComida implements MessageGetComida {
  const _$MessageGetComida(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ComidaState.message(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageGetComida &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageGetComidaCopyWith<_$MessageGetComida> get copyWith =>
      __$$MessageGetComidaCopyWithImpl<_$MessageGetComida>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) message,
    required TResult Function(Comida data) loadSuccess,
  }) {
    return message(this.message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? message,
    TResult? Function(Comida data)? loadSuccess,
  }) {
    return message?.call(this.message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? message,
    TResult Function(Comida data)? loadSuccess,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this.message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialComida value) initial,
    required TResult Function(MessageGetComida value) message,
    required TResult Function(LoadSuccessGetComida value) loadSuccess,
  }) {
    return message(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialComida value)? initial,
    TResult? Function(MessageGetComida value)? message,
    TResult? Function(LoadSuccessGetComida value)? loadSuccess,
  }) {
    return message?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialComida value)? initial,
    TResult Function(MessageGetComida value)? message,
    TResult Function(LoadSuccessGetComida value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this);
    }
    return orElse();
  }
}

abstract class MessageGetComida implements ComidaState {
  const factory MessageGetComida(final String message) = _$MessageGetComida;

  String get message;
  @JsonKey(ignore: true)
  _$$MessageGetComidaCopyWith<_$MessageGetComida> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSuccessGetComidaCopyWith<$Res> {
  factory _$$LoadSuccessGetComidaCopyWith(_$LoadSuccessGetComida value,
          $Res Function(_$LoadSuccessGetComida) then) =
      __$$LoadSuccessGetComidaCopyWithImpl<$Res>;
  @useResult
  $Res call({Comida data});
}

/// @nodoc
class __$$LoadSuccessGetComidaCopyWithImpl<$Res>
    extends _$ComidaStateCopyWithImpl<$Res, _$LoadSuccessGetComida>
    implements _$$LoadSuccessGetComidaCopyWith<$Res> {
  __$$LoadSuccessGetComidaCopyWithImpl(_$LoadSuccessGetComida _value,
      $Res Function(_$LoadSuccessGetComida) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadSuccessGetComida(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Comida,
    ));
  }
}

/// @nodoc

class _$LoadSuccessGetComida implements LoadSuccessGetComida {
  const _$LoadSuccessGetComida({required this.data});

  @override
  final Comida data;

  @override
  String toString() {
    return 'ComidaState.loadSuccess(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessGetComida &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessGetComidaCopyWith<_$LoadSuccessGetComida> get copyWith =>
      __$$LoadSuccessGetComidaCopyWithImpl<_$LoadSuccessGetComida>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) message,
    required TResult Function(Comida data) loadSuccess,
  }) {
    return loadSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? message,
    TResult? Function(Comida data)? loadSuccess,
  }) {
    return loadSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? message,
    TResult Function(Comida data)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialComida value) initial,
    required TResult Function(MessageGetComida value) message,
    required TResult Function(LoadSuccessGetComida value) loadSuccess,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialComida value)? initial,
    TResult? Function(MessageGetComida value)? message,
    TResult? Function(LoadSuccessGetComida value)? loadSuccess,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialComida value)? initial,
    TResult Function(MessageGetComida value)? message,
    TResult Function(LoadSuccessGetComida value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class LoadSuccessGetComida implements ComidaState {
  const factory LoadSuccessGetComida({required final Comida data}) =
      _$LoadSuccessGetComida;

  Comida get data;
  @JsonKey(ignore: true)
  _$$LoadSuccessGetComidaCopyWith<_$LoadSuccessGetComida> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ComidaEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) getComida,
    required TResult Function(String message) pusgmessage,
    required TResult Function(Comida data) pushComida,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? getComida,
    TResult? Function(String message)? pusgmessage,
    TResult? Function(Comida data)? pushComida,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? getComida,
    TResult Function(String message)? pusgmessage,
    TResult Function(Comida data)? pushComida,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComida value) getComida,
    required TResult Function(_MessageComidaEvent value) pusgmessage,
    required TResult Function(_PushGetComida value) pushComida,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComida value)? getComida,
    TResult? Function(_MessageComidaEvent value)? pusgmessage,
    TResult? Function(_PushGetComida value)? pushComida,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComida value)? getComida,
    TResult Function(_MessageComidaEvent value)? pusgmessage,
    TResult Function(_PushGetComida value)? pushComida,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComidaEventCopyWith<$Res> {
  factory $ComidaEventCopyWith(
          ComidaEvent value, $Res Function(ComidaEvent) then) =
      _$ComidaEventCopyWithImpl<$Res, ComidaEvent>;
}

/// @nodoc
class _$ComidaEventCopyWithImpl<$Res, $Val extends ComidaEvent>
    implements $ComidaEventCopyWith<$Res> {
  _$ComidaEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetComidaCopyWith<$Res> {
  factory _$$_GetComidaCopyWith(
          _$_GetComida value, $Res Function(_$_GetComida) then) =
      __$$_GetComidaCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_GetComidaCopyWithImpl<$Res>
    extends _$ComidaEventCopyWithImpl<$Res, _$_GetComida>
    implements _$$_GetComidaCopyWith<$Res> {
  __$$_GetComidaCopyWithImpl(
      _$_GetComida _value, $Res Function(_$_GetComida) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_GetComida(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetComida implements _GetComida {
  const _$_GetComida(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ComidaEvent.getComida(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetComida &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetComidaCopyWith<_$_GetComida> get copyWith =>
      __$$_GetComidaCopyWithImpl<_$_GetComida>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) getComida,
    required TResult Function(String message) pusgmessage,
    required TResult Function(Comida data) pushComida,
  }) {
    return getComida(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? getComida,
    TResult? Function(String message)? pusgmessage,
    TResult? Function(Comida data)? pushComida,
  }) {
    return getComida?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? getComida,
    TResult Function(String message)? pusgmessage,
    TResult Function(Comida data)? pushComida,
    required TResult orElse(),
  }) {
    if (getComida != null) {
      return getComida(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComida value) getComida,
    required TResult Function(_MessageComidaEvent value) pusgmessage,
    required TResult Function(_PushGetComida value) pushComida,
  }) {
    return getComida(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComida value)? getComida,
    TResult? Function(_MessageComidaEvent value)? pusgmessage,
    TResult? Function(_PushGetComida value)? pushComida,
  }) {
    return getComida?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComida value)? getComida,
    TResult Function(_MessageComidaEvent value)? pusgmessage,
    TResult Function(_PushGetComida value)? pushComida,
    required TResult orElse(),
  }) {
    if (getComida != null) {
      return getComida(this);
    }
    return orElse();
  }
}

abstract class _GetComida implements ComidaEvent {
  const factory _GetComida(final String id) = _$_GetComida;

  String get id;
  @JsonKey(ignore: true)
  _$$_GetComidaCopyWith<_$_GetComida> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MessageComidaEventCopyWith<$Res> {
  factory _$$_MessageComidaEventCopyWith(_$_MessageComidaEvent value,
          $Res Function(_$_MessageComidaEvent) then) =
      __$$_MessageComidaEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_MessageComidaEventCopyWithImpl<$Res>
    extends _$ComidaEventCopyWithImpl<$Res, _$_MessageComidaEvent>
    implements _$$_MessageComidaEventCopyWith<$Res> {
  __$$_MessageComidaEventCopyWithImpl(
      _$_MessageComidaEvent _value, $Res Function(_$_MessageComidaEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_MessageComidaEvent(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MessageComidaEvent implements _MessageComidaEvent {
  const _$_MessageComidaEvent(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ComidaEvent.pusgmessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageComidaEvent &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageComidaEventCopyWith<_$_MessageComidaEvent> get copyWith =>
      __$$_MessageComidaEventCopyWithImpl<_$_MessageComidaEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) getComida,
    required TResult Function(String message) pusgmessage,
    required TResult Function(Comida data) pushComida,
  }) {
    return pusgmessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? getComida,
    TResult? Function(String message)? pusgmessage,
    TResult? Function(Comida data)? pushComida,
  }) {
    return pusgmessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? getComida,
    TResult Function(String message)? pusgmessage,
    TResult Function(Comida data)? pushComida,
    required TResult orElse(),
  }) {
    if (pusgmessage != null) {
      return pusgmessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComida value) getComida,
    required TResult Function(_MessageComidaEvent value) pusgmessage,
    required TResult Function(_PushGetComida value) pushComida,
  }) {
    return pusgmessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComida value)? getComida,
    TResult? Function(_MessageComidaEvent value)? pusgmessage,
    TResult? Function(_PushGetComida value)? pushComida,
  }) {
    return pusgmessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComida value)? getComida,
    TResult Function(_MessageComidaEvent value)? pusgmessage,
    TResult Function(_PushGetComida value)? pushComida,
    required TResult orElse(),
  }) {
    if (pusgmessage != null) {
      return pusgmessage(this);
    }
    return orElse();
  }
}

abstract class _MessageComidaEvent implements ComidaEvent {
  const factory _MessageComidaEvent(final String message) =
      _$_MessageComidaEvent;

  String get message;
  @JsonKey(ignore: true)
  _$$_MessageComidaEventCopyWith<_$_MessageComidaEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PushGetComidaCopyWith<$Res> {
  factory _$$_PushGetComidaCopyWith(
          _$_PushGetComida value, $Res Function(_$_PushGetComida) then) =
      __$$_PushGetComidaCopyWithImpl<$Res>;
  @useResult
  $Res call({Comida data});
}

/// @nodoc
class __$$_PushGetComidaCopyWithImpl<$Res>
    extends _$ComidaEventCopyWithImpl<$Res, _$_PushGetComida>
    implements _$$_PushGetComidaCopyWith<$Res> {
  __$$_PushGetComidaCopyWithImpl(
      _$_PushGetComida _value, $Res Function(_$_PushGetComida) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_PushGetComida(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Comida,
    ));
  }
}

/// @nodoc

class _$_PushGetComida implements _PushGetComida {
  const _$_PushGetComida({required this.data});

  @override
  final Comida data;

  @override
  String toString() {
    return 'ComidaEvent.pushComida(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PushGetComida &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PushGetComidaCopyWith<_$_PushGetComida> get copyWith =>
      __$$_PushGetComidaCopyWithImpl<_$_PushGetComida>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) getComida,
    required TResult Function(String message) pusgmessage,
    required TResult Function(Comida data) pushComida,
  }) {
    return pushComida(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? getComida,
    TResult? Function(String message)? pusgmessage,
    TResult? Function(Comida data)? pushComida,
  }) {
    return pushComida?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? getComida,
    TResult Function(String message)? pusgmessage,
    TResult Function(Comida data)? pushComida,
    required TResult orElse(),
  }) {
    if (pushComida != null) {
      return pushComida(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComida value) getComida,
    required TResult Function(_MessageComidaEvent value) pusgmessage,
    required TResult Function(_PushGetComida value) pushComida,
  }) {
    return pushComida(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetComida value)? getComida,
    TResult? Function(_MessageComidaEvent value)? pusgmessage,
    TResult? Function(_PushGetComida value)? pushComida,
  }) {
    return pushComida?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComida value)? getComida,
    TResult Function(_MessageComidaEvent value)? pusgmessage,
    TResult Function(_PushGetComida value)? pushComida,
    required TResult orElse(),
  }) {
    if (pushComida != null) {
      return pushComida(this);
    }
    return orElse();
  }
}

abstract class _PushGetComida implements ComidaEvent {
  const factory _PushGetComida({required final Comida data}) = _$_PushGetComida;

  Comida get data;
  @JsonKey(ignore: true)
  _$$_PushGetComidaCopyWith<_$_PushGetComida> get copyWith =>
      throw _privateConstructorUsedError;
}
