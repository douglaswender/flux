import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/modules/home/presentation/widgets/map_widget/map_widget_store.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapWidget extends StatefulWidget {
  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends ModularState<MapWidget, MapWidgetStore> {
  bool permissionLocalization = false;

  @override
  MapWidgetStore get store => super.store;

  @override
  void initState() {
    super.initState();
    store.getPermissionStatus();
  }

  Future<LocationData> getCurrentLocation() async {
    LocationData currentLocation = await store.setInitialLocalization();

    return currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(-10.72, -62.25), zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          store.controller.complete(controller);
        },
      ),
    );
  }
}
