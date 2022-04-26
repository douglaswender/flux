import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_rider/app/shared/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:geolocator/geolocator.dart';
import '../../domain/entities/address.dart';
import '../models/address_model.dart';
import '../models/delivery_model.dart';

abstract class DeliveryDatasource {
  late StreamSubscription<Position> mapPositionStream;
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
  Future<bool> getDeliveryForDriver({
    required String deliveryId,
    required String userId,
  });
  Future<List<DeliveryModel>> getDeliveries({
    String? userId,
  });
  Future<bool> setDeliveryConcluded(
      {required String deliveryId, required String userId});
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
        driverName: snapshot.child('driver_name').value.toString(),
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
  Future<List<DeliveryModel>> getDeliveries({String? userId}) async {
    List<DeliveryModel> deliveries = [];

    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('delivery/');

    final snapshot = await userRef.get();

    if (snapshot.exists) {
      snapshot.children.forEach((allDeliveries) {
        print(allDeliveries);

        allDeliveries.children
            .where((element) =>
                element.child("driver_id").value.toString() == "waiting" ||
                element.child("driver_id").value.toString() == userId)
            .toList()
            .forEach((userDeliveries) {
          print(userDeliveries);
          deliveries.add(setData(userDeliveries));
        });
      });
    }

    print(deliveries.toString());
    return deliveries.reversed.toList();
  }

  @override
  Future<bool> getDeliveryForDriver(
      {required String deliveryId, required String userId}) async {
    DatabaseReference deliveryRef =
        FirebaseDatabase.instance.ref().child('delivery/$userId/$deliveryId');

    try {
      final userInfo = Modular.get<AuthRepositoryImpl>();

      print(deliveryRef);
      deliveryRef
          .update({
            'driver_id': userInfo.userModel!.id,
            'driver_name': userInfo.userModel!.name,
          })
          .then((value) => print('updated'))
          .catchError((e) => print(e));

      getLocationUpdates();

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> setDeliveryConcluded(
      {required String deliveryId, required String userId}) async {
    DatabaseReference deliveryRef =
        FirebaseDatabase.instance.ref().child('delivery/$userId/$deliveryId');

    try {
      final userInfo = Modular.get<AuthRepositoryImpl>();

      print(deliveryRef);
      deliveryRef
          .update({
            'driver_id': userInfo.userModel!.id,
            'driver_name': userInfo.userModel!.name,
            'status': 'finished'
          })
          .then((value) => print('updated'))
          .catchError((e) => print(e));

      mapPositionStream.cancel();

      return true;
    } catch (e) {
      return false;
    }
  }

  void getLocationUpdates() {
    final currentUser = Modular.get<AuthRepositoryImpl>();
    mapPositionStream = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 4,
    ).listen((Position position) {
      Geofire.initialize('drivers_working');
      Geofire.setLocation(
          currentUser.userModel!.id!, position.latitude, position.longitude);
    });
  }

  DeliveryModel setData(DataSnapshot data) {
    return DeliveryModel(
      createdAt: data.child('created_at').value.toString(),
      deliveryId: data.key,
      destinationAddress: data.child('destination_address').value.toString(),
      destinationLocation: AddressModel(
        latitude: double.parse(
            data.child('destination_location/latitude').value.toString()),
        longitude: double.parse(
            data.child('destination_location/longitude').value.toString()),
      ),
      driverId: data.child('driver_id').value.toString(),
      driverName: data.child('driver_name').value.toString(),
      originAddress: data.child('origin_address').value.toString(),
      originLocation: AddressModel(
        latitude: double.parse(
            data.child('origin_location/latitude').value.toString()),
        longitude: double.parse(
            data.child('origin_location/longitude').value.toString()),
      ),
      userId: data.child('request_user_id').value.toString(),
      userName: data.child('request_user_name').value.toString(),
      valueOfRun: int.parse(data.child('value_of_run').value.toString()),
      phoneNumber: data.child('request_phone_number').value.toString(),
      deliveryDescription: data.child('delivery_description').value.toString(),
      deliveryDocument: data.child('delivery_document').value.toString(),
      deliveryReceiver: data.child('delivery_receiver').value.toString(),
      status: data.child('status').value.toString(),
    );
  }

  @override
  late StreamSubscription<Position> mapPositionStream;
}
