import 'package:connectivity/connectivity.dart';
import 'package:flux_client/app/core/helpers/request_helper.dart';
import 'package:flux_client/app/modules/home/data/models/address_model.dart';
import 'package:flux_client/app/modules/home/data/models/direction_model.dart';
import 'package:flux_client/app/shared/preferences/config.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HelperMethods {
  static Future<AddressModel> findCordinateAddress(Position position) async {
    String placeAddress = '';

    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      return Future.value(null);
    }

    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${Config.globalMapKey}";

    var response = await RequestHelper.getRequest(url);

    if (response != 'failure') {
      placeAddress = response['results'][0]['formatted_address'];
      AddressModel pickupAddress = AddressModel(
          longitude: position.longitude,
          latitude: position.latitude,
          placeName: placeAddress);
      return pickupAddress;
    } else {
      return Future.value(null);
    }
  }

  static Future<DirectionModel> getDirectionDetails(
      LatLng origin, LatLng destination) async {
    print(Config.directionsUrl(origin, destination));
    var response = await RequestHelper.getRequest(
        Config.directionsUrl(origin, destination));

    if (response == 'failure') {
      return Future.value(null);
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
}
