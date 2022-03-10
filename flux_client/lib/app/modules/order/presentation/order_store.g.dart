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

  final _$listOrderItensAtom = Atom(name: '_OrderStoreBase.listOrderItens');

  @override
  List<DeliveryModel>? get listOrderItens {
    _$listOrderItensAtom.reportRead();
    return super.listOrderItens;
  }

  @override
  set listOrderItens(List<DeliveryModel>? value) {
    _$listOrderItensAtom.reportWrite(value, super.listOrderItens, () {
      super.listOrderItens = value;
    });
  }

  final _$loadingAtom = Atom(name: '_OrderStoreBase.loading');

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

  final _$getUserDeliveriesAsyncAction =
      AsyncAction('_OrderStoreBase.getUserDeliveries');

  @override
  Future getUserDeliveries() {
    return _$getUserDeliveriesAsyncAction.run(() => super.getUserDeliveries());
  }

  @override
  String toString() {
    return '''
index: ${index},
listOrderItens: ${listOrderItens},
loading: ${loading}
    ''';
  }
}
