import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

part 'map_widget_store.g.dart';

class MapWidgetStore = MapWidgetStoreBase with _$MapWidgetStore;

abstract class MapWidgetStoreBase with Store {
  @observable
  Completer<GoogleMapController> controller = Completer();

  @observable
  late GoogleMapController mapController;

  @observable
  CameraPosition? cp;

  @observable
  CameraPosition kTest = CameraPosition(target: LatLng(-40, -80), zoom: 20);

  @action
  Future<void> setInitialLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );

    LatLng pos = LatLng(currentPosition.latitude, currentPosition.longitude);
    cp = CameraPosition(target: pos, zoom: 14);

    mapController.animateCamera(CameraUpdate.newCameraPosition(cp!));
  }

  Future<void> getPermissionStatus() async {
    print('status');
    print(await Permission.location.status);
    if (await Permission.location.status == PermissionStatus.denied) {
      await Permission.location.request();
    }
  }
}
