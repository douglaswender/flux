import 'dart:convert';

import 'package:flux_client/app/modules/home/data/models/address_model.dart';
import 'package:flux_client/app/shared/modules/delivery/domain/entities/delivery.dart';

class DeliveryModel extends Delivery {
  final String? deliveryId;
  final String? createdAt;
  final String? originAddress;
  final String? destinationAddress;
  final String? driverId;
  final String? phoneNumber;
  final String? userId;
  final String? userName;
  final int? valueOfRun;
  final AddressModel? originLocation;
  final AddressModel? destinationLocation;

  DeliveryModel({
    this.deliveryId,
    this.createdAt,
    this.originAddress,
    this.destinationAddress,
    this.driverId,
    this.phoneNumber,
    this.userId,
    this.userName,
    this.valueOfRun,
    this.originLocation,
    this.destinationLocation,
  });

  DeliveryModel copyWith({
    String? deliveryId,
    String? createdAt,
    String? originAddress,
    String? destinationAddress,
    String? driverId,
    String? phoneNumber,
    String? userId,
    String? userName,
    int? valueOfRun,
    AddressModel? originLocation,
    AddressModel? destinationLocation,
  }) {
    return DeliveryModel(
      deliveryId: deliveryId ?? this.deliveryId,
      createdAt: createdAt ?? this.createdAt,
      originAddress: originAddress ?? this.originAddress,
      destinationAddress: destinationAddress ?? this.destinationAddress,
      driverId: driverId ?? this.driverId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      valueOfRun: valueOfRun ?? this.valueOfRun,
      originLocation: originLocation ?? this.originLocation,
      destinationLocation: destinationLocation ?? this.destinationLocation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deliveryId': deliveryId,
      'createdAt': createdAt,
      'originAddress': originAddress,
      'destinationAddress': destinationAddress,
      'driverId': driverId,
      'phoneNumber': phoneNumber,
      'userId': userId,
      'userName': userName,
      'valueOfRun': valueOfRun,
      'originLocation': originLocation?.toMap(),
      'destinationLocation': destinationLocation?.toMap(),
    };
  }

  factory DeliveryModel.fromMap(Map<String, dynamic> map) {
    return DeliveryModel(
      deliveryId: map['deliveryId'],
      createdAt: map['createdAt'],
      originAddress: map['originAddress'],
      destinationAddress: map['destinationAddress'],
      driverId: map['driverId'],
      phoneNumber: map['phoneNumber'],
      userId: map['userId'],
      userName: map['userName'],
      valueOfRun: map['valueOfRun']?.toInt(),
      originLocation: map['originLocation'] != null
          ? AddressModel.fromMap(map['originLocation'])
          : null,
      destinationLocation: map['destinationLocation'] != null
          ? AddressModel.fromMap(map['destinationLocation'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryModel.fromJson(String source) =>
      DeliveryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DeliveryModel(deliveryId: $deliveryId, createdAt: $createdAt, originAddress: $originAddress, destinationAddress: $destinationAddress, driverId: $driverId, phoneNumber: $phoneNumber, userId: $userId, userName: $userName, valueOfRun: $valueOfRun, originLocation: $originLocation, destinationLocation: $destinationLocation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeliveryModel &&
        other.deliveryId == deliveryId &&
        other.createdAt == createdAt &&
        other.originAddress == originAddress &&
        other.destinationAddress == destinationAddress &&
        other.driverId == driverId &&
        other.phoneNumber == phoneNumber &&
        other.userId == userId &&
        other.userName == userName &&
        other.valueOfRun == valueOfRun &&
        other.originLocation == originLocation &&
        other.destinationLocation == destinationLocation;
  }

  @override
  int get hashCode {
    return deliveryId.hashCode ^
        createdAt.hashCode ^
        originAddress.hashCode ^
        destinationAddress.hashCode ^
        driverId.hashCode ^
        phoneNumber.hashCode ^
        userId.hashCode ^
        userName.hashCode ^
        valueOfRun.hashCode ^
        originLocation.hashCode ^
        destinationLocation.hashCode;
  }
}
