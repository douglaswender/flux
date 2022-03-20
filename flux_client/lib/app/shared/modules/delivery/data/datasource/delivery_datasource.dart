import 'package:firebase_database/firebase_database.dart';
import 'package:flux_client/app/modules/home/data/models/address_model.dart';
import 'package:flux_client/app/modules/home/domain/entities/address.dart';

import 'package:flux_client/app/shared/modules/delivery/data/models/delivery_model.dart';

abstract class DeliveryDatasource {
  Future<String> publishDelivery({
    required Address originAddress,
    required Address destinationAddress,
    required String phoneNumber,
    required String userId,
    required String userName,
    required int valueOfRun,
    required String deliveryReceiver,
    required String deliveryDocument,
    required String deliveryDescription,
  });
  Future<DeliveryModel> getDelivery({
    required String deliveryId,
    required String userId,
  });
  Future<bool> deleteDelivery({
    required String deliveryId,
    required String userId,
  });
  Future<List<DeliveryModel>> getDeliveries({
    required String userId,
  });
}

class DeliveryDatasourceImpl implements DeliveryDatasource {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  @override
  Future<String> publishDelivery({
    required Address originAddress,
    required Address destinationAddress,
    required String phoneNumber,
    required String userId,
    required String userName,
    required int valueOfRun,
    required String deliveryReceiver,
    required String deliveryDocument,
    required String deliveryDescription,
  }) async {
    try {
      final ref = _database.ref().child('delivery/$userId/').push();

      Map deliveryMap = {
        'created_at': DateTime.now().toString(),
        'request_user_name': userName,
        'request_phone_number': phoneNumber,
        'origin_address': originAddress.placeName,
        'destination_address': destinationAddress.placeName,
        'origin_location': {
          'latitude': originAddress.latitude,
          'longitude': originAddress.longitude,
        },
        'destination_location': {
          'latitude': destinationAddress.latitude,
          'longitude': destinationAddress.longitude,
        },
        'payment_method': 'card',
        'driver_id': 'waiting',
        'request_user_id': userId,
        'value_of_run': valueOfRun,
        'delivery_receiver': deliveryReceiver,
        'delivery_document': deliveryDocument,
        'delivery_description': deliveryDescription,
      };

      ref.set(deliveryMap);

      print(ref.key);

      return ref.key!;
    } catch (e) {
      return 'error';
    }
  }

  @override
  Future<DeliveryModel> getDelivery(
      {required String deliveryId, required String userId}) async {
    DeliveryModel? delivery;
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('delivery/$userId/$deliveryId');

    final snapshot = await userRef.get();

    if (snapshot.exists) {
      delivery = DeliveryModel(
        createdAt: snapshot.child('created_at').value.toString(),
        deliveryId: deliveryId,
        destinationAddress:
            snapshot.child('destination_address').value.toString(),
        destinationLocation: AddressModel(
          latitude: double.parse(
              snapshot.child('destination_location/latitude').value.toString()),
          longitude: double.parse(snapshot
              .child('destination_location/longitude')
              .value
              .toString()),
        ),
        driverId: snapshot.child('driver_id').value.toString(),
        originAddress: snapshot.child('origin_address').value.toString(),
        originLocation: AddressModel(
          latitude: double.parse(
              snapshot.child('origin_location/latitude').value.toString()),
          longitude: double.parse(
              snapshot.child('origin_location/longitude').value.toString()),
        ),
        userId: snapshot.child('request_user_id').value.toString(),
        userName: snapshot.child('request_user_name').value.toString(),
        valueOfRun: int.parse(snapshot.child('value_of_run').value.toString()),
        phoneNumber: snapshot.child('request_phone_number').value.toString(),
        deliveryDescription:
            snapshot.child('delivery_description').value.toString(),
        deliveryDocument: snapshot.child('delivery_document').value.toString(),
        deliveryReceiver: snapshot.child('delivery_receiver').value.toString(),
      );
    }

    print(delivery.toString());
    return delivery!;
  }

  @override
  Future<List<DeliveryModel>> getDeliveries({required String userId}) async {
    List<DeliveryModel> deliveries = [];
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('delivery/$userId/');

    final snapshot = await userRef.get();

    if (snapshot.exists) {
      snapshot.children.forEach((element) {
        print(element);
        deliveries.add(DeliveryModel(
          createdAt: element.child('created_at').value.toString(),
          deliveryId: element.key,
          destinationAddress:
              element.child('destination_address').value.toString(),
          destinationLocation: AddressModel(
            latitude: double.parse(element
                .child('destination_location/latitude')
                .value
                .toString()),
            longitude: double.parse(element
                .child('destination_location/longitude')
                .value
                .toString()),
          ),
          driverId: element.child('driver_id').value.toString(),
          originAddress: element.child('origin_address').value.toString(),
          originLocation: AddressModel(
            latitude: double.parse(
                element.child('origin_location/latitude').value.toString()),
            longitude: double.parse(
                element.child('origin_location/longitude').value.toString()),
          ),
          userId: element.child('request_user_id').value.toString(),
          userName: element.child('request_user_name').value.toString(),
          valueOfRun: int.parse(element.child('value_of_run').value.toString()),
          phoneNumber: element.child('request_phone_number').value.toString(),
          deliveryDescription:
              element.child('delivery_description').value.toString(),
          deliveryDocument: element.child('delivery_document').value.toString(),
          deliveryReceiver: element.child('delivery_receiver').value.toString(),
        ));
      });
    }

    print(deliveries.toString());
    return deliveries.reversed.toList();
  }

  @override
  Future<bool> deleteDelivery(
      {required String deliveryId, required String userId}) async {
    DatabaseReference deliveryRef =
        FirebaseDatabase.instance.ref().child('delivery/$userId/$deliveryId');

    try {
      print(deliveryRef);
      deliveryRef
          .remove()
          .then((value) => print('removed'))
          .catchError((e) => print(e));
      return true;
    } catch (e) {
      return false;
    }
  }
}
