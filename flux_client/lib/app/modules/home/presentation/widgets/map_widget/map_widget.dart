import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../home_store.dart';

class MapWidget extends StatefulWidget {
  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends ModularState<MapWidget, HomeStore> {
  @override
  void initState() {
    super.initState();
    controller.getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (BuildContext context) => !controller.loading
            ? GoogleMap(
                zoomControlsEnabled: false,
                zoomGesturesEnabled: true,
                polylines: controller.polylines,
                markers: controller.markers,
                circles: controller.circles,
                mapType: MapType.normal,
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                initialCameraPosition:
                    CameraPosition(target: controller.originLatLng!, zoom: 14),
                onMapCreated: (GoogleMapController thisController) {
                  if (!controller.mapInitialized) {
                    controller.setMapController(thisController);
                  }
                },
              )
            : Container());
  }
}
