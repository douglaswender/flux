import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'map_widget_store.g.dart';

class MapWidgetStore = MapWidgetStoreBase with _$MapWidgetStore;

abstract class MapWidgetStoreBase with Store {
  @observable
  Completer<GoogleMapController> controller = Completer();

  @observable
  CameraPosition kLake = CameraPosition(target: LatLng(-19.7063603, -43.9861004), zoom: 20);

  @observable
  late GoogleMapController controllerMap;

  Future<void> goToTheLake() async {
    final GoogleMapController controllerMap = await controller.future;
    controllerMap.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }

  CameraPosition initializeLocalization() {
    return CameraPosition(
      target: LatLng(-19.6970389, -43.9913397),
      zoom: 15,
    );
  }
}
