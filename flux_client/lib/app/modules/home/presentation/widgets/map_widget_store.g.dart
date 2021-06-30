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

  final _$kLakeAtom = Atom(name: 'MapWidgetStoreBase.kLake');

  @override
  CameraPosition get kLake {
    _$kLakeAtom.reportRead();
    return super.kLake;
  }

  @override
  set kLake(CameraPosition value) {
    _$kLakeAtom.reportWrite(value, super.kLake, () {
      super.kLake = value;
    });
  }

  final _$controllerMapAtom = Atom(name: 'MapWidgetStoreBase.controllerMap');

  @override
  GoogleMapController get controllerMap {
    _$controllerMapAtom.reportRead();
    return super.controllerMap;
  }

  @override
  set controllerMap(GoogleMapController value) {
    _$controllerMapAtom.reportWrite(value, super.controllerMap, () {
      super.controllerMap = value;
    });
  }

  @override
  String toString() {
    return '''
controller: ${controller},
kLake: ${kLake},
controllerMap: ${controllerMap}
    ''';
  }
}
