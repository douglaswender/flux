import 'address.dart';

class Delivery {
  final String? deliveryId;
  final String? createdAt;
  final String? originAddress;
  final String? destinationAddress;
  final String? driverId;
  final String? phoneNumber;
  final String? userId;
  final int? valueOfRun;
  final Address? originLocation;
  final Address? destinationLocation;

  Delivery({
    this.deliveryId,
    this.createdAt,
    this.originAddress,
    this.destinationAddress,
    this.driverId,
    this.phoneNumber,
    this.userId,
    this.valueOfRun,
    this.originLocation,
    this.destinationLocation,
  });
}
