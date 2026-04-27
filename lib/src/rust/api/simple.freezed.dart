// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KvmEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KvmEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KvmEvent()';
}


}

/// @nodoc
class $KvmEventCopyWith<$Res>  {
$KvmEventCopyWith(KvmEvent _, $Res Function(KvmEvent) __);
}


/// Adds pattern-matching-related methods to [KvmEvent].
extension KvmEventPatterns on KvmEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( KvmEvent_MouseMove value)?  mouseMove,TResult Function( KvmEvent_MouseButtonPress value)?  mouseButtonPress,TResult Function( KvmEvent_MouseButtonRelease value)?  mouseButtonRelease,TResult Function( KvmEvent_KeyPress value)?  keyPress,TResult Function( KvmEvent_KeyRelease value)?  keyRelease,TResult Function( KvmEvent_Wheel value)?  wheel,required TResult orElse(),}){
final _that = this;
switch (_that) {
case KvmEvent_MouseMove() when mouseMove != null:
return mouseMove(_that);case KvmEvent_MouseButtonPress() when mouseButtonPress != null:
return mouseButtonPress(_that);case KvmEvent_MouseButtonRelease() when mouseButtonRelease != null:
return mouseButtonRelease(_that);case KvmEvent_KeyPress() when keyPress != null:
return keyPress(_that);case KvmEvent_KeyRelease() when keyRelease != null:
return keyRelease(_that);case KvmEvent_Wheel() when wheel != null:
return wheel(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( KvmEvent_MouseMove value)  mouseMove,required TResult Function( KvmEvent_MouseButtonPress value)  mouseButtonPress,required TResult Function( KvmEvent_MouseButtonRelease value)  mouseButtonRelease,required TResult Function( KvmEvent_KeyPress value)  keyPress,required TResult Function( KvmEvent_KeyRelease value)  keyRelease,required TResult Function( KvmEvent_Wheel value)  wheel,}){
final _that = this;
switch (_that) {
case KvmEvent_MouseMove():
return mouseMove(_that);case KvmEvent_MouseButtonPress():
return mouseButtonPress(_that);case KvmEvent_MouseButtonRelease():
return mouseButtonRelease(_that);case KvmEvent_KeyPress():
return keyPress(_that);case KvmEvent_KeyRelease():
return keyRelease(_that);case KvmEvent_Wheel():
return wheel(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( KvmEvent_MouseMove value)?  mouseMove,TResult? Function( KvmEvent_MouseButtonPress value)?  mouseButtonPress,TResult? Function( KvmEvent_MouseButtonRelease value)?  mouseButtonRelease,TResult? Function( KvmEvent_KeyPress value)?  keyPress,TResult? Function( KvmEvent_KeyRelease value)?  keyRelease,TResult? Function( KvmEvent_Wheel value)?  wheel,}){
final _that = this;
switch (_that) {
case KvmEvent_MouseMove() when mouseMove != null:
return mouseMove(_that);case KvmEvent_MouseButtonPress() when mouseButtonPress != null:
return mouseButtonPress(_that);case KvmEvent_MouseButtonRelease() when mouseButtonRelease != null:
return mouseButtonRelease(_that);case KvmEvent_KeyPress() when keyPress != null:
return keyPress(_that);case KvmEvent_KeyRelease() when keyRelease != null:
return keyRelease(_that);case KvmEvent_Wheel() when wheel != null:
return wheel(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( double x,  double y)?  mouseMove,TResult Function( int button)?  mouseButtonPress,TResult Function( int button)?  mouseButtonRelease,TResult Function( String key)?  keyPress,TResult Function( String key)?  keyRelease,TResult Function( PlatformInt64 deltaX,  PlatformInt64 deltaY)?  wheel,required TResult orElse(),}) {final _that = this;
switch (_that) {
case KvmEvent_MouseMove() when mouseMove != null:
return mouseMove(_that.x,_that.y);case KvmEvent_MouseButtonPress() when mouseButtonPress != null:
return mouseButtonPress(_that.button);case KvmEvent_MouseButtonRelease() when mouseButtonRelease != null:
return mouseButtonRelease(_that.button);case KvmEvent_KeyPress() when keyPress != null:
return keyPress(_that.key);case KvmEvent_KeyRelease() when keyRelease != null:
return keyRelease(_that.key);case KvmEvent_Wheel() when wheel != null:
return wheel(_that.deltaX,_that.deltaY);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( double x,  double y)  mouseMove,required TResult Function( int button)  mouseButtonPress,required TResult Function( int button)  mouseButtonRelease,required TResult Function( String key)  keyPress,required TResult Function( String key)  keyRelease,required TResult Function( PlatformInt64 deltaX,  PlatformInt64 deltaY)  wheel,}) {final _that = this;
switch (_that) {
case KvmEvent_MouseMove():
return mouseMove(_that.x,_that.y);case KvmEvent_MouseButtonPress():
return mouseButtonPress(_that.button);case KvmEvent_MouseButtonRelease():
return mouseButtonRelease(_that.button);case KvmEvent_KeyPress():
return keyPress(_that.key);case KvmEvent_KeyRelease():
return keyRelease(_that.key);case KvmEvent_Wheel():
return wheel(_that.deltaX,_that.deltaY);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( double x,  double y)?  mouseMove,TResult? Function( int button)?  mouseButtonPress,TResult? Function( int button)?  mouseButtonRelease,TResult? Function( String key)?  keyPress,TResult? Function( String key)?  keyRelease,TResult? Function( PlatformInt64 deltaX,  PlatformInt64 deltaY)?  wheel,}) {final _that = this;
switch (_that) {
case KvmEvent_MouseMove() when mouseMove != null:
return mouseMove(_that.x,_that.y);case KvmEvent_MouseButtonPress() when mouseButtonPress != null:
return mouseButtonPress(_that.button);case KvmEvent_MouseButtonRelease() when mouseButtonRelease != null:
return mouseButtonRelease(_that.button);case KvmEvent_KeyPress() when keyPress != null:
return keyPress(_that.key);case KvmEvent_KeyRelease() when keyRelease != null:
return keyRelease(_that.key);case KvmEvent_Wheel() when wheel != null:
return wheel(_that.deltaX,_that.deltaY);case _:
  return null;

}
}

}

/// @nodoc


class KvmEvent_MouseMove extends KvmEvent {
  const KvmEvent_MouseMove({required this.x, required this.y}): super._();
  

 final  double x;
 final  double y;

/// Create a copy of KvmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KvmEvent_MouseMoveCopyWith<KvmEvent_MouseMove> get copyWith => _$KvmEvent_MouseMoveCopyWithImpl<KvmEvent_MouseMove>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KvmEvent_MouseMove&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}


@override
int get hashCode => Object.hash(runtimeType,x,y);

@override
String toString() {
  return 'KvmEvent.mouseMove(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class $KvmEvent_MouseMoveCopyWith<$Res> implements $KvmEventCopyWith<$Res> {
  factory $KvmEvent_MouseMoveCopyWith(KvmEvent_MouseMove value, $Res Function(KvmEvent_MouseMove) _then) = _$KvmEvent_MouseMoveCopyWithImpl;
@useResult
$Res call({
 double x, double y
});




}
/// @nodoc
class _$KvmEvent_MouseMoveCopyWithImpl<$Res>
    implements $KvmEvent_MouseMoveCopyWith<$Res> {
  _$KvmEvent_MouseMoveCopyWithImpl(this._self, this._then);

  final KvmEvent_MouseMove _self;
  final $Res Function(KvmEvent_MouseMove) _then;

/// Create a copy of KvmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,}) {
  return _then(KvmEvent_MouseMove(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class KvmEvent_MouseButtonPress extends KvmEvent {
  const KvmEvent_MouseButtonPress({required this.button}): super._();
  

 final  int button;

/// Create a copy of KvmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KvmEvent_MouseButtonPressCopyWith<KvmEvent_MouseButtonPress> get copyWith => _$KvmEvent_MouseButtonPressCopyWithImpl<KvmEvent_MouseButtonPress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KvmEvent_MouseButtonPress&&(identical(other.button, button) || other.button == button));
}


@override
int get hashCode => Object.hash(runtimeType,button);

@override
String toString() {
  return 'KvmEvent.mouseButtonPress(button: $button)';
}


}

/// @nodoc
abstract mixin class $KvmEvent_MouseButtonPressCopyWith<$Res> implements $KvmEventCopyWith<$Res> {
  factory $KvmEvent_MouseButtonPressCopyWith(KvmEvent_MouseButtonPress value, $Res Function(KvmEvent_MouseButtonPress) _then) = _$KvmEvent_MouseButtonPressCopyWithImpl;
@useResult
$Res call({
 int button
});




}
/// @nodoc
class _$KvmEvent_MouseButtonPressCopyWithImpl<$Res>
    implements $KvmEvent_MouseButtonPressCopyWith<$Res> {
  _$KvmEvent_MouseButtonPressCopyWithImpl(this._self, this._then);

  final KvmEvent_MouseButtonPress _self;
  final $Res Function(KvmEvent_MouseButtonPress) _then;

/// Create a copy of KvmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? button = null,}) {
  return _then(KvmEvent_MouseButtonPress(
button: null == button ? _self.button : button // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class KvmEvent_MouseButtonRelease extends KvmEvent {
  const KvmEvent_MouseButtonRelease({required this.button}): super._();
  

 final  int button;

/// Create a copy of KvmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KvmEvent_MouseButtonReleaseCopyWith<KvmEvent_MouseButtonRelease> get copyWith => _$KvmEvent_MouseButtonReleaseCopyWithImpl<KvmEvent_MouseButtonRelease>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KvmEvent_MouseButtonRelease&&(identical(other.button, button) || other.button == button));
}


@override
int get hashCode => Object.hash(runtimeType,button);

@override
String toString() {
  return 'KvmEvent.mouseButtonRelease(button: $button)';
}


}

/// @nodoc
abstract mixin class $KvmEvent_MouseButtonReleaseCopyWith<$Res> implements $KvmEventCopyWith<$Res> {
  factory $KvmEvent_MouseButtonReleaseCopyWith(KvmEvent_MouseButtonRelease value, $Res Function(KvmEvent_MouseButtonRelease) _then) = _$KvmEvent_MouseButtonReleaseCopyWithImpl;
@useResult
$Res call({
 int button
});




}
/// @nodoc
class _$KvmEvent_MouseButtonReleaseCopyWithImpl<$Res>
    implements $KvmEvent_MouseButtonReleaseCopyWith<$Res> {
  _$KvmEvent_MouseButtonReleaseCopyWithImpl(this._self, this._then);

  final KvmEvent_MouseButtonRelease _self;
  final $Res Function(KvmEvent_MouseButtonRelease) _then;

/// Create a copy of KvmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? button = null,}) {
  return _then(KvmEvent_MouseButtonRelease(
button: null == button ? _self.button : button // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class KvmEvent_KeyPress extends KvmEvent {
  const KvmEvent_KeyPress({required this.key}): super._();
  

 final  String key;

/// Create a copy of KvmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KvmEvent_KeyPressCopyWith<KvmEvent_KeyPress> get copyWith => _$KvmEvent_KeyPressCopyWithImpl<KvmEvent_KeyPress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KvmEvent_KeyPress&&(identical(other.key, key) || other.key == key));
}


@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'KvmEvent.keyPress(key: $key)';
}


}

/// @nodoc
abstract mixin class $KvmEvent_KeyPressCopyWith<$Res> implements $KvmEventCopyWith<$Res> {
  factory $KvmEvent_KeyPressCopyWith(KvmEvent_KeyPress value, $Res Function(KvmEvent_KeyPress) _then) = _$KvmEvent_KeyPressCopyWithImpl;
@useResult
$Res call({
 String key
});




}
/// @nodoc
class _$KvmEvent_KeyPressCopyWithImpl<$Res>
    implements $KvmEvent_KeyPressCopyWith<$Res> {
  _$KvmEvent_KeyPressCopyWithImpl(this._self, this._then);

  final KvmEvent_KeyPress _self;
  final $Res Function(KvmEvent_KeyPress) _then;

/// Create a copy of KvmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? key = null,}) {
  return _then(KvmEvent_KeyPress(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class KvmEvent_KeyRelease extends KvmEvent {
  const KvmEvent_KeyRelease({required this.key}): super._();
  

 final  String key;

/// Create a copy of KvmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KvmEvent_KeyReleaseCopyWith<KvmEvent_KeyRelease> get copyWith => _$KvmEvent_KeyReleaseCopyWithImpl<KvmEvent_KeyRelease>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KvmEvent_KeyRelease&&(identical(other.key, key) || other.key == key));
}


@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'KvmEvent.keyRelease(key: $key)';
}


}

/// @nodoc
abstract mixin class $KvmEvent_KeyReleaseCopyWith<$Res> implements $KvmEventCopyWith<$Res> {
  factory $KvmEvent_KeyReleaseCopyWith(KvmEvent_KeyRelease value, $Res Function(KvmEvent_KeyRelease) _then) = _$KvmEvent_KeyReleaseCopyWithImpl;
@useResult
$Res call({
 String key
});




}
/// @nodoc
class _$KvmEvent_KeyReleaseCopyWithImpl<$Res>
    implements $KvmEvent_KeyReleaseCopyWith<$Res> {
  _$KvmEvent_KeyReleaseCopyWithImpl(this._self, this._then);

  final KvmEvent_KeyRelease _self;
  final $Res Function(KvmEvent_KeyRelease) _then;

/// Create a copy of KvmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? key = null,}) {
  return _then(KvmEvent_KeyRelease(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class KvmEvent_Wheel extends KvmEvent {
  const KvmEvent_Wheel({required this.deltaX, required this.deltaY}): super._();
  

 final  PlatformInt64 deltaX;
 final  PlatformInt64 deltaY;

/// Create a copy of KvmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KvmEvent_WheelCopyWith<KvmEvent_Wheel> get copyWith => _$KvmEvent_WheelCopyWithImpl<KvmEvent_Wheel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KvmEvent_Wheel&&(identical(other.deltaX, deltaX) || other.deltaX == deltaX)&&(identical(other.deltaY, deltaY) || other.deltaY == deltaY));
}


@override
int get hashCode => Object.hash(runtimeType,deltaX,deltaY);

@override
String toString() {
  return 'KvmEvent.wheel(deltaX: $deltaX, deltaY: $deltaY)';
}


}

/// @nodoc
abstract mixin class $KvmEvent_WheelCopyWith<$Res> implements $KvmEventCopyWith<$Res> {
  factory $KvmEvent_WheelCopyWith(KvmEvent_Wheel value, $Res Function(KvmEvent_Wheel) _then) = _$KvmEvent_WheelCopyWithImpl;
@useResult
$Res call({
 PlatformInt64 deltaX, PlatformInt64 deltaY
});




}
/// @nodoc
class _$KvmEvent_WheelCopyWithImpl<$Res>
    implements $KvmEvent_WheelCopyWith<$Res> {
  _$KvmEvent_WheelCopyWithImpl(this._self, this._then);

  final KvmEvent_Wheel _self;
  final $Res Function(KvmEvent_Wheel) _then;

/// Create a copy of KvmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deltaX = null,Object? deltaY = null,}) {
  return _then(KvmEvent_Wheel(
deltaX: null == deltaX ? _self.deltaX : deltaX // ignore: cast_nullable_to_non_nullable
as PlatformInt64,deltaY: null == deltaY ? _self.deltaY : deltaY // ignore: cast_nullable_to_non_nullable
as PlatformInt64,
  ));
}


}

// dart format on
