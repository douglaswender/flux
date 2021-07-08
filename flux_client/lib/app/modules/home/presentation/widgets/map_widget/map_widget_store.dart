import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
part 'map_widget_store.g.dart';

class MapWidgetStore = MapWidgetStoreBase with _$MapWidgetStore;

abstract class MapWidgetStoreBase with Store {
  @observable
  Completer<GoogleMapController> controller = Completer();

  @observable
  CameraPosition kLake = CameraPosition(target: LatLng(-19.7063603, -43.9861004), zoom: 20);

  @observable
  CameraPosition kTest = CameraPosition(target: LatLng(-40, -80), zoom: 20);

  @action
  Future<void> goToTheLake() async {
    GoogleMapController controllerMap = await controller.future;
    controllerMap.animateCamera(CameraUpdate.newCameraPosition(kTest));
  }

  Future<void> getPermissionStatus() async {
    print('status');
    if (await Permission.location.status == PermissionStatus.denied) {
      await Permission.location.request();
    }
  }
}
