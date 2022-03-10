// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderItemStore on _OrderItemStoreBase, Store {
  final _$loadingAtom = Atom(name: '_OrderItemStoreBase.loading');

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

  final _$deliveryAtom = Atom(name: '_OrderItemStoreBase.delivery');

  @override
  DeliveryModel? get delivery {
    _$deliveryAtom.reportRead();
    return super.delivery;
  }

  @override
  set delivery(DeliveryModel? value) {
    _$deliveryAtom.reportWrite(value, super.delivery, () {
      super.delivery = value;
    });
  }

  final _$getInfosAsyncAction = AsyncAction('_OrderItemStoreBase.getInfos');

  @override
  Future getInfos({required String deliveryId, required String userId}) {
    return _$getInfosAsyncAction
        .run(() => super.getInfos(deliveryId: deliveryId, userId: userId));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
delivery: ${delivery}
    ''';
  }
}
