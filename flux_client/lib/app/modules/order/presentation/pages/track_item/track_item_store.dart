import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'track_item_store.g.dart';

class TrackItemStore = _TrackItemStoreBase with _$TrackItemStore;

abstract class _TrackItemStoreBase with Store {
  @observable
  bool loading = true;

  @observable
  GoogleMapController? mapController;

  @observable
  LatLng? driverPosition;

  @action
  Future<void> getLocationDriver({String? driverId}) async {
    final snapshot =
        await FirebaseDatabase.instance.ref('drivers_working/$driverId').get();

    if (snapshot.exists) {
      driverPosition = LatLng(
        double.parse(
          snapshot.child('l/0').value.toString(),
        ),
        double.parse(
          snapshot.child('l/1').value.toString(),
        ),
      );
    } else {
      driverPosition = null;
    }

    loading = false;
  }

  @action
  void updatedRefDatabase({String? driverId}) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref('drivers_working/$driverId');

    ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot;
      driverPosition = LatLng(
        double.parse(
          data.child('l/0').value.toString(),
        ),
        double.parse(
          data.child('l/1').value.toString(),
        ),
      );
      mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: driverPosition!, zoom: 17)));
    });
  }
}
