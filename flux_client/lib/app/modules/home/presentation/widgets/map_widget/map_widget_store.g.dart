// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_widget_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapWidgetStore on MapWidgetStoreBase, Store {
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

  final _$mapControllerAtom = Atom(name: 'MapWidgetStoreBase.mapController');

  @override
  GoogleMapController get mapController {
    _$mapControllerAtom.reportRead();
    return super.mapController;
  }

  @override
  set mapController(GoogleMapController value) {
    _$mapControllerAtom.reportWrite(value, super.mapController, () {
      super.mapController = value;
    });
  }

  final _$cpAtom = Atom(name: 'MapWidgetStoreBase.cp');

  @override
  CameraPosition? get cp {
    _$cpAtom.reportRead();
    return super.cp;
  }

  @override
  set cp(CameraPosition? value) {
    _$cpAtom.reportWrite(value, super.cp, () {
      super.cp = value;
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

  final _$setInitialLocationAsyncAction =
      AsyncAction('MapWidgetStoreBase.setInitialLocation');

  @override
  Future<void> setInitialLocation() {
    return _$setInitialLocationAsyncAction
        .run(() => super.setInitialLocation());
  }

  @override
  String toString() {
    return '''
controller: ${controller},
mapController: ${mapController},
cp: ${cp},
kTest: ${kTest}
    ''';
  }
}
