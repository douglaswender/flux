// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$listOrderItensAtom = Atom(name: '_HomeStoreBase.listOrderItens');

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

  final _$loadingAtom = Atom(name: '_HomeStoreBase.loading');

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

  final _$getAllDeliveriesAsyncAction =
      AsyncAction('_HomeStoreBase.getAllDeliveries');

  @override
  Future getAllDeliveries() {
    return _$getAllDeliveriesAsyncAction.run(() => super.getAllDeliveries());
  }

  @override
  String toString() {
    return '''
listOrderItens: ${listOrderItens},
loading: ${loading}
    ''';
  }
}
