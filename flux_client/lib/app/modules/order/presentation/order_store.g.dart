// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderStore on _OrderStoreBase, Store {
  final _$indexAtom = Atom(name: '_OrderStoreBase.index');

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

  final _$_OrderStoreBaseActionController =
      ActionController(name: '_OrderStoreBase');

  @override
  void setIndex(int newIndex) {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.setIndex');
    try {
      return super.setIndex(newIndex);
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
