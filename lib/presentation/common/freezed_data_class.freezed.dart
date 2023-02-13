// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginObjectCopyWith(
          _$_LoginObject value, $Res Function(_$_LoginObject) then) =
      __$$_LoginObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class __$$_LoginObjectCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$_LoginObject>
    implements _$$_LoginObjectCopyWith<$Res> {
  __$$_LoginObjectCopyWithImpl(
      _$_LoginObject _value, $Res Function(_$_LoginObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_$_LoginObject(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.userName, this.password);

  @override
  final String userName;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(userName: $userName, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginObject &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      __$$_LoginObjectCopyWithImpl<_$_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String userName, final String password) =
      _$_LoginObject;

  @override
  String get userName;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EmailObject {
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailObjectCopyWith<EmailObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailObjectCopyWith<$Res> {
  factory $EmailObjectCopyWith(
          EmailObject value, $Res Function(EmailObject) then) =
      _$EmailObjectCopyWithImpl<$Res, EmailObject>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$EmailObjectCopyWithImpl<$Res, $Val extends EmailObject>
    implements $EmailObjectCopyWith<$Res> {
  _$EmailObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmailObjectCopyWith<$Res>
    implements $EmailObjectCopyWith<$Res> {
  factory _$$_EmailObjectCopyWith(
          _$_EmailObject value, $Res Function(_$_EmailObject) then) =
      __$$_EmailObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_EmailObjectCopyWithImpl<$Res>
    extends _$EmailObjectCopyWithImpl<$Res, _$_EmailObject>
    implements _$$_EmailObjectCopyWith<$Res> {
  __$$_EmailObjectCopyWithImpl(
      _$_EmailObject _value, $Res Function(_$_EmailObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_EmailObject(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailObject implements _EmailObject {
  _$_EmailObject(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'EmailObject(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailObject &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailObjectCopyWith<_$_EmailObject> get copyWith =>
      __$$_EmailObjectCopyWithImpl<_$_EmailObject>(this, _$identity);
}

abstract class _EmailObject implements EmailObject {
  factory _EmailObject(final String email) = _$_EmailObject;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_EmailObjectCopyWith<_$_EmailObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignupObject {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get countryMobileCode => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupObjectCopyWith<SignupObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupObjectCopyWith<$Res> {
  factory $SignupObjectCopyWith(
          SignupObject value, $Res Function(SignupObject) then) =
      _$SignupObjectCopyWithImpl<$Res, SignupObject>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String countryMobileCode,
      String mobileNumber,
      String email,
      String password,
      String confirmPassword,
      String profilePicture});
}

/// @nodoc
class _$SignupObjectCopyWithImpl<$Res, $Val extends SignupObject>
    implements $SignupObjectCopyWith<$Res> {
  _$SignupObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? countryMobileCode = null,
    Object? mobileNumber = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? profilePicture = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      countryMobileCode: null == countryMobileCode
          ? _value.countryMobileCode
          : countryMobileCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignupObjectCopyWith<$Res>
    implements $SignupObjectCopyWith<$Res> {
  factory _$$_SignupObjectCopyWith(
          _$_SignupObject value, $Res Function(_$_SignupObject) then) =
      __$$_SignupObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String countryMobileCode,
      String mobileNumber,
      String email,
      String password,
      String confirmPassword,
      String profilePicture});
}

/// @nodoc
class __$$_SignupObjectCopyWithImpl<$Res>
    extends _$SignupObjectCopyWithImpl<$Res, _$_SignupObject>
    implements _$$_SignupObjectCopyWith<$Res> {
  __$$_SignupObjectCopyWithImpl(
      _$_SignupObject _value, $Res Function(_$_SignupObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? countryMobileCode = null,
    Object? mobileNumber = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? profilePicture = null,
  }) {
    return _then(_$_SignupObject(
      null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      null == countryMobileCode
          ? _value.countryMobileCode
          : countryMobileCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignupObject implements _SignupObject {
  _$_SignupObject(
      this.firstName,
      this.lastName,
      this.countryMobileCode,
      this.mobileNumber,
      this.email,
      this.password,
      this.confirmPassword,
      this.profilePicture);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String countryMobileCode;
  @override
  final String mobileNumber;
  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String profilePicture;

  @override
  String toString() {
    return 'SignupObject(firstName: $firstName, lastName: $lastName, countryMobileCode: $countryMobileCode, mobileNumber: $mobileNumber, email: $email, password: $password, confirmPassword: $confirmPassword, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignupObject &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.countryMobileCode, countryMobileCode) ||
                other.countryMobileCode == countryMobileCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      countryMobileCode,
      mobileNumber,
      email,
      password,
      confirmPassword,
      profilePicture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignupObjectCopyWith<_$_SignupObject> get copyWith =>
      __$$_SignupObjectCopyWithImpl<_$_SignupObject>(this, _$identity);
}

abstract class _SignupObject implements SignupObject {
  factory _SignupObject(
      final String firstName,
      final String lastName,
      final String countryMobileCode,
      final String mobileNumber,
      final String email,
      final String password,
      final String confirmPassword,
      final String profilePicture) = _$_SignupObject;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get countryMobileCode;
  @override
  String get mobileNumber;
  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  String get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$$_SignupObjectCopyWith<_$_SignupObject> get copyWith =>
      throw _privateConstructorUsedError;
}
