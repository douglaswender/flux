import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' hide PermissionStatus;
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

part 'map_widget_store.g.dart';

class MapWidgetStore = MapWidgetStoreBase with _$MapWidgetStore;

abstract class MapWidgetStoreBase with Store {
  final localization = new Location();

  @observable
  Completer<GoogleMapController> controller = Completer();

  @computed
  Future<LocationData> get setLocation async => await setInitialLocalization();

  @observable
  CameraPosition kTest = CameraPosition(target: LatLng(-40, -80), zoom: 20);

  Future<LocationData> setInitialLocalization() async {
    LocationData currentLocation = await localization.onLocationChanged.first;
    return currentLocation;
  }

  @action
  Future<void> goToTheLake() async {
    GoogleMapController controllerMap = await controller.future;
    controllerMap.animateCamera(CameraUpdate.newCameraPosition(kTest));
  }

  Future<void> getPermissionStatus() async {
    print('status');
    print(await Permission.location.status);
    if (await Permission.location.status == PermissionStatus.denied) {
      await Permission.location.request();
    }
  }
}
