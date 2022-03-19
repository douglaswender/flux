import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flux_client/app/shared/modules/auth/data/models/user_model.dart';
import 'request_helper.dart';
import '../../modules/home/data/models/address_model.dart';
import '../../modules/home/data/models/direction_model.dart';
import '../../shared/preferences/config.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HelperMethods {
  static Future<UserModel?> getCurrentUserInfo() async {
    User? currentUser = FirebaseAuth.instance.currentUser!;
    UserModel? currentUserInfo;
    String userId = currentUser.uid;

    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('users/$userId');

    final snapshot = await userRef.get();

    if (snapshot.exists) {
      currentUserInfo = UserModel(
        email: snapshot.child('email').value.toString(),
        id: userId,
        name: snapshot.child('name').value.toString(),
        phoneNumber: snapshot.child('phoneNumber').value.toString(),
      );
    }
    return currentUserInfo;
  }

  static Future<AddressModel> findCordinateAddress(Position position) async {
    String placeAddress = '';

    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      return Future.value(AddressModel());
    }

    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${Config.mapKey}";

    var response = await RequestHelper.getRequest(url);

    if (response != 'failure') {
      placeAddress = response['results'][0]['formatted_address'];
      AddressModel pickupAddress = AddressModel(
          longitude: position.longitude,
          latitude: position.latitude,
          placeName: placeAddress);
      return pickupAddress;
    } else {
      return Future.value(AddressModel());
    }
  }

  static Future<DirectionModel> getDirectionDetails(
      LatLng origin, LatLng destination) async {
    print(Config.directionsUrl(origin, destination));
    var response = await RequestHelper.getRequest(
        Config.directionsUrl(origin, destination));

    if (response == 'failure') {
      return Future.value(DirectionModel());
    }

    DirectionModel direction = DirectionModel(
        distanceText:
            response['routes'][0]['legs'][0]['distance']['text'] ?? "",
        durationText:
            response['routes'][0]['legs'][0]['duration']['text'] ?? "",
        distanceValue:
            response['routes'][0]['legs'][0]['distance']['value'] ?? 0,
        durationValue:
            response['routes'][0]['legs'][0]['duration']['value'] ?? 0,
        encodedPoints:
            response['routes'][0]['overview_polyline']['points'] ?? "");

    return direction;
  }

  static int estimateFares(DirectionModel direction) {
    double minutes = (direction.durationValue! / 60);

    double? totalFare;

    // se distância for menor ou igual que 10 km
    // taxa = 10
    // km = 0.8
    // min = 0.5
    // se distância for maior que 10 km
    // taxa = 20
    // km = 0.6
    // min = 0.6

    if (direction.distanceValue! / 1000 <= 10) {
      double baseFare = 10;
      double distanceFare = (direction.distanceValue! / 1000) * 0.8;
      double timeFare = minutes * 0.5;
      totalFare = baseFare + distanceFare + timeFare;
    } else {
      double baseFare = 20;
      double distanceFare = (direction.distanceValue! / 1000) * 0.4;
      double timeFare = minutes * 0.25;
      totalFare = baseFare + distanceFare + timeFare;
    }

    return totalFare.truncate() * 100;
  }
}
