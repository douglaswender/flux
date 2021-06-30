import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/modules/home/presentation/widgets/map_widget_store.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends ModularState<MapSample, MapWidgetStore> {
  @override
  MapWidgetStore get store => super.store;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: store.initializeLocalization(),
        onMapCreated: (GoogleMapController controller) {
          store.controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: store.goToTheLake,
        label: Text('Para casa!!'),
        icon: Icon(Icons.home),
      ),
    );
  }
}
