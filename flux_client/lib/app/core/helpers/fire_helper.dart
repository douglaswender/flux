import 'package:flux_client/app/modules/home/data/models/nearby_driver.dart';

class FireHelper {
  static List<NearbyDriver> nearByDriverList = [];

  static void removeFromList(String key) {
    int index = nearByDriverList.indexWhere((element) => element.key == key);
    nearByDriverList.removeAt(index);
  }

  static void updateNearbyLocation(NearbyDriver driver) {
    int index =
        nearByDriverList.indexWhere((element) => element.key == driver.key);
    nearByDriverList[index].longitude = driver.longitude;
    nearByDriverList[index].latitude = driver.latitude;
  }
}
