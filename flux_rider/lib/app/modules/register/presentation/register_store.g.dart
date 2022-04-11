// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStoreBase, Store {
  Computed<bool>? _$fieldsNotNullComputed;

  @override
  bool get fieldsNotNull =>
      (_$fieldsNotNullComputed ??= Computed<bool>(() => super.fieldsNotNull,
              name: '_RegisterStoreBase.fieldsNotNull'))
          .value;

  final _$loadingAtom = Atom(name: '_RegisterStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$nameAtom = Atom(name: '_RegisterStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_RegisterStoreBase.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom =
      Atom(name: '_RegisterStoreBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$passwordNotMatchAtom =
      Atom(name: '_RegisterStoreBase.passwordNotMatch');

  @override
  bool get passwordNotMatch {
    _$passwordNotMatchAtom.reportRead();
    return super.passwordNotMatch;
  }

  @override
  set passwordNotMatch(bool value) {
    _$passwordNotMatchAtom.reportWrite(value, super.passwordNotMatch, () {
      super.passwordNotMatch = value;
    });
  }

  final _$carModelAtom = Atom(name: '_RegisterStoreBase.carModel');

  @override
  String get carModel {
    _$carModelAtom.reportRead();
    return super.carModel;
  }

  @override
  set carModel(String value) {
    _$carModelAtom.reportWrite(value, super.carModel, () {
      super.carModel = value;
    });
  }

  final _$carColorAtom = Atom(name: '_RegisterStoreBase.carColor');

  @override
  String get carColor {
    _$carColorAtom.reportRead();
    return super.carColor;
  }

  @override
  set carColor(String value) {
    _$carColorAtom.reportWrite(value, super.carColor, () {
      super.carColor = value;
    });
  }

  final _$carIdAtom = Atom(name: '_RegisterStoreBase.carId');

  @override
  String get carId {
    _$carIdAtom.reportRead();
    return super.carId;
  }

  @override
  set carId(String value) {
    _$carIdAtom.reportWrite(value, super.carId, () {
      super.carId = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('_RegisterStoreBase.register');

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
email: ${email},
name: ${name},
phoneNumber: ${phoneNumber},
password: ${password},
confirmPassword: ${confirmPassword},
passwordNotMatch: ${passwordNotMatch},
carModel: ${carModel},
carColor: ${carColor},
carId: ${carId},
fieldsNotNull: ${fieldsNotNull}
    ''';
  }
}
