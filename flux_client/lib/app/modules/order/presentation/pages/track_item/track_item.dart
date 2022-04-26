import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/modules/order/presentation/pages/track_item/track_item_store.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackItem extends StatefulWidget {
  final String? driverId;
  const TrackItem({Key? key, this.driverId}) : super(key: key);

  @override
  State<TrackItem> createState() => _TrackItemState();
}

class _TrackItemState extends ModularState<TrackItem, TrackItemStore> {
  @override
  void initState() {
    super.initState();
    controller.getLocationDriver(driverId: widget.driverId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Observer(builder: (_) {
          if (controller.loading == true) {
            return Container();
          } else {
            return GoogleMap(
              markers: {
                Marker(
                    position: controller.driverPosition!,
                    markerId: MarkerId('id'),
                    icon: BitmapDescriptor.defaultMarker)
              },
              mapType: MapType.normal,
              initialCameraPosition:
                  CameraPosition(target: controller.driverPosition!, zoom: 17),
              onMapCreated: (GoogleMapController mapController) async {
                controller.mapController = mapController;
                controller.updatedRefDatabase(driverId: widget.driverId);
              },
            );
          }
        }),
      ),
    );
  }
}
