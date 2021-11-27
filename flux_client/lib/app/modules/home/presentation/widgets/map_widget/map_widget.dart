import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/helpers/helper_methods.dart';
import 'package:flux_client/app/modules/home/data/models/address_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../home_store.dart';

class MapWidget extends StatefulWidget {
  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends ModularState<MapWidget, HomeStore> {
  Completer<GoogleMapController> _controller = Completer();

  late Position currentPosition;

  late CameraPosition cp;

  LatLng? _initialPosition;

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });
    controller.mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: _initialPosition!, zoom: 15)));

    AddressModel address = await HelperMethods.findCordinateAddress(position);

    controller.updatePickupAddress(address);
  }

  @override
  void initState() {
    super.initState();
    controller.loading = true;
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => !controller.loading
          ? GoogleMap(
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              polylines: controller.polylines,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: _initialPosition!, zoom: 14),
              onMapCreated: (GoogleMapController thisController) {
                _controller.complete(thisController);
                controller.mapController = thisController;

                setState(() {});

                //_getUserLocation();
              },
            )
          : Container(),
    );
  }
}
