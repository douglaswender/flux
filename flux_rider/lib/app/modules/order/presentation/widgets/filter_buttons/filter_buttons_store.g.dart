// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_buttons_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterButtonStore on _FilterButtonStoreBase, Store {
  final _$indexAtom = Atom(name: '_FilterButtonStoreBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$_FilterButtonStoreBaseActionController =
      ActionController(name: '_FilterButtonStoreBase');

  @override
  void setIndex(int newIndex) {
    final _$actionInfo = _$_FilterButtonStoreBaseActionController.startAction(
        name: '_FilterButtonStoreBase.setIndex');
    try {
      return super.setIndex(newIndex);
    } finally {
      _$_FilterButtonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearIndex() {
    final _$actionInfo = _$_FilterButtonStoreBaseActionController.startAction(
        name: '_FilterButtonStoreBase.clearIndex');
    try {
      return super.clearIndex();
    } finally {
      _$_FilterButtonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
