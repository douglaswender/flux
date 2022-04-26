import 'dart:convert';

import '../../domain/entities/delivery.dart';
import 'address_model.dart';

class DeliveryModel extends Delivery {
  final String? deliveryId;
  final String? createdAt;
  final String? originAddress;
  final String? destinationAddress;
  final String? driverId;
  final String? driverName;
  final String? phoneNumber;
  final String? userId;
  final String? userName;
  final int? valueOfRun;
  final AddressModel? originLocation;
  final AddressModel? destinationLocation;
  final String? deliveryDocument;
  final String? deliveryReceiver;
  final String? deliveryDescription;
  final String? status;

  DeliveryModel({
    this.deliveryId,
    this.createdAt,
    this.originAddress,
    this.destinationAddress,
    this.driverId,
    this.driverName,
    this.phoneNumber,
    this.userId,
    this.userName,
    this.valueOfRun,
    this.originLocation,
    this.destinationLocation,
    this.deliveryDocument,
    this.deliveryReceiver,
    this.deliveryDescription,
    this.status,
  });

  DeliveryModel copyWith({
    String? deliveryId,
    String? createdAt,
    String? originAddress,
    String? destinationAddress,
    String? driverId,
    String? driverName,
    String? phoneNumber,
    String? userId,
    String? userName,
    int? valueOfRun,
    AddressModel? originLocation,
    AddressModel? destinationLocation,
    String? deliveryDocument,
    String? deliveryReceiver,
    String? deliveryDescription,
    String? status,
  }) {
    return DeliveryModel(
      deliveryId: deliveryId ?? this.deliveryId,
      createdAt: createdAt ?? this.createdAt,
      originAddress: originAddress ?? this.originAddress,
      destinationAddress: destinationAddress ?? this.destinationAddress,
      driverId: driverId ?? this.driverId,
      driverName: driverName ?? this.driverName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      valueOfRun: valueOfRun ?? this.valueOfRun,
      originLocation: originLocation ?? this.originLocation,
      destinationLocation: destinationLocation ?? this.destinationLocation,
      deliveryDocument: deliveryDocument ?? this.deliveryDocument,
      deliveryReceiver: deliveryReceiver ?? this.deliveryReceiver,
      deliveryDescription: deliveryDescription ?? this.deliveryDescription,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deliveryId': deliveryId,
      'createdAt': createdAt,
      'originAddress': originAddress,
      'destinationAddress': destinationAddress,
      'driverId': driverId,
      'driverName': driverName,
      'phoneNumber': phoneNumber,
      'userId': userId,
      'userName': userName,
      'valueOfRun': valueOfRun,
      'originLocation': originLocation?.toMap(),
      'destinationLocation': destinationLocation?.toMap(),
      'deliveryDocument': deliveryDocument,
      'deliveryReceiver': deliveryReceiver,
      'deliveryDescription': deliveryDescription,
      'status': status,
    };
  }

  factory DeliveryModel.fromMap(Map<String, dynamic> map) {
    return DeliveryModel(
      deliveryId: map['deliveryId'],
      createdAt: map['createdAt'],
      originAddress: map['originAddress'],
      destinationAddress: map['destinationAddress'],
      driverId: map['driverId'],
      driverName: map['driverName'],
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
      deliveryDocument: map['deliveryDocument'],
      deliveryReceiver: map['deliveryReceiver'],
      deliveryDescription: map['deliveryDescription'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryModel.fromJson(String source) =>
      DeliveryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DeliveryModel(deliveryId: $deliveryId, createdAt: $createdAt, originAddress: $originAddress, destinationAddress: $destinationAddress, driverId: $driverId, driverName: $driverName, phoneNumber: $phoneNumber, userId: $userId, userName: $userName, valueOfRun: $valueOfRun, originLocation: $originLocation, destinationLocation: $destinationLocation, deliveryDocument: $deliveryDocument, deliveryReceiver: $deliveryReceiver, deliveryDescription: $deliveryDescription, status: $status)';
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
        other.driverName == driverName &&
        other.phoneNumber == phoneNumber &&
        other.userId == userId &&
        other.userName == userName &&
        other.valueOfRun == valueOfRun &&
        other.originLocation == originLocation &&
        other.destinationLocation == destinationLocation &&
        other.deliveryDocument == deliveryDocument &&
        other.deliveryReceiver == deliveryReceiver &&
        other.deliveryDescription == deliveryDescription &&
        other.status == status;
  }

  @override
  int get hashCode {
    return deliveryId.hashCode ^
        createdAt.hashCode ^
        originAddress.hashCode ^
        destinationAddress.hashCode ^
        driverId.hashCode ^
        driverName.hashCode ^
        phoneNumber.hashCode ^
        userId.hashCode ^
        userName.hashCode ^
        valueOfRun.hashCode ^
        originLocation.hashCode ^
        destinationLocation.hashCode ^
        deliveryDocument.hashCode ^
        deliveryReceiver.hashCode ^
        deliveryDescription.hashCode ^
        status.hashCode;
  }
}
