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

  final _$registerAsyncAction = AsyncAction('_RegisterStoreBase.register');

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
email: ${email},
name: ${name},
password: ${password},
confirmPassword: ${confirmPassword},
passwordNotMatch: ${passwordNotMatch},
fieldsNotNull: ${fieldsNotNull}
    ''';
  }
}
