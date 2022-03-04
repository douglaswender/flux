import 'package:firebase_database/firebase_database.dart';
import 'package:flux_client/app/modules/home/domain/entities/address.dart';

abstract class DeliveryDatasource {
  Future<bool> publishDelivery({
    required Address originAddreess,
    required Address destinationAddress,
    required String phoneNumber,
    required String userName,
  });
}

class DeliveryDatasourceImpl implements DeliveryDatasource {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  @override
  Future<bool> publishDelivery({
    required Address originAddreess,
    required Address destinationAddress,
    required String phoneNumber,
    required String userName,
  }) async {
    // TODO: implement publishDelivery
    try {
      final ref = _database.ref().child('delivery').push();

      Map deliveryMap = {
        'created_at': DateTime.now().toString(),
        'request_user_name': userName,
        'request_phone_number': phoneNumber,
        'origin_address': originAddreess.placeName,
        'destination_address': destinationAddress.placeName,
        'origin_location': {
          'latitude': originAddreess.latitude,
          'longitude': originAddreess.longitude,
        },
        'destination_location': {
          'latitude': destinationAddress.latitude,
          'longitude': destinationAddress.longitude,
        },
        'payment_method': 'card',
        'driver_id': 'waiting',
      };

      ref.set(deliveryMap);

      return true;
    } catch (e) {
      return false;
    }
  }
}
