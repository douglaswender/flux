import 'package:connectivity/connectivity.dart';
import 'package:flux_client/app/core/helpers/request_helper.dart';
import 'package:flux_client/app/modules/home/data/models/address_model.dart';
import 'package:flux_client/app/shared/preferences/config.dart';
import 'package:geolocator/geolocator.dart';

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
}
