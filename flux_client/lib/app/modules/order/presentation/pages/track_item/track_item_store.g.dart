// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TrackItemStore on _TrackItemStoreBase, Store {
  final _$loadingAtom = Atom(name: '_TrackItemStoreBase.loading');

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

  final _$mapControllerAtom = Atom(name: '_TrackItemStoreBase.mapController');

  @override
  GoogleMapController? get mapController {
    _$mapControllerAtom.reportRead();
    return super.mapController;
  }

  @override
  set mapController(GoogleMapController? value) {
    _$mapControllerAtom.reportWrite(value, super.mapController, () {
      super.mapController = value;
    });
  }

  final _$driverPositionAtom = Atom(name: '_TrackItemStoreBase.driverPosition');

  @override
  LatLng? get driverPosition {
    _$driverPositionAtom.reportRead();
    return super.driverPosition;
  }

  @override
  set driverPosition(LatLng? value) {
    _$driverPositionAtom.reportWrite(value, super.driverPosition, () {
      super.driverPosition = value;
    });
  }

  final _$getLocationDriverAsyncAction =
      AsyncAction('_TrackItemStoreBase.getLocationDriver');

  @override
  Future<void> getLocationDriver({String? driverId}) {
    return _$getLocationDriverAsyncAction
        .run(() => super.getLocationDriver(driverId: driverId));
  }

  final _$_TrackItemStoreBaseActionController =
      ActionController(name: '_TrackItemStoreBase');

  @override
  void updatedRefDatabase({String? driverId}) {
    final _$actionInfo = _$_TrackItemStoreBaseActionController.startAction(
        name: '_TrackItemStoreBase.updatedRefDatabase');
    try {
      return super.updatedRefDatabase(driverId: driverId);
    } finally {
      _$_TrackItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
mapController: ${mapController},
driverPosition: ${driverPosition}
    ''';
  }
}
