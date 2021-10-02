// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_widget_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapWidgetStore on MapWidgetStoreBase, Store {
  Computed<Future<LocationData>>? _$setLocationComputed;

  @override
  Future<LocationData> get setLocation => (_$setLocationComputed ??=
          Computed<Future<LocationData>>(() => super.setLocation,
              name: 'MapWidgetStoreBase.setLocation'))
      .value;

  final _$controllerAtom = Atom(name: 'MapWidgetStoreBase.controller');

  @override
  Completer<GoogleMapController> get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(Completer<GoogleMapController> value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$kTestAtom = Atom(name: 'MapWidgetStoreBase.kTest');

  @override
  CameraPosition get kTest {
    _$kTestAtom.reportRead();
    return super.kTest;
  }

  @override
  set kTest(CameraPosition value) {
    _$kTestAtom.reportWrite(value, super.kTest, () {
      super.kTest = value;
    });
  }

  final _$goToTheLakeAsyncAction =
      AsyncAction('MapWidgetStoreBase.goToTheLake');

  @override
  Future<void> goToTheLake() {
    return _$goToTheLakeAsyncAction.run(() => super.goToTheLake());
  }

  @override
  String toString() {
    return '''
controller: ${controller},
kTest: ${kTest},
setLocation: ${setLocation}
    ''';
  }
}
