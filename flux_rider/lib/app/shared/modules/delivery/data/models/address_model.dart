import 'dart:convert';

import '../../domain/entities/address.dart';

class AddressModel extends Address {
  final String? placeName;
  final double? latitude;
  final double? longitude;
  final String? placeId;
  final String? placeFormattedAddress;

  AddressModel({
    this.placeName,
    this.latitude,
    this.longitude,
    this.placeId,
    this.placeFormattedAddress,
  });

  AddressModel copyWith({
    String? placeName,
    double? latitude,
    double? longitude,
    String? placeId,
    String? placeFormattedAddress,
  }) {
    return AddressModel(
      placeName: placeName ?? this.placeName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      placeId: placeId ?? this.placeId,
      placeFormattedAddress:
          placeFormattedAddress ?? this.placeFormattedAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'placeName': placeName,
      'latitude': latitude,
      'longitude': longitude,
      'placeId': placeId,
      'placeFormattedAddress': placeFormattedAddress,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      placeName: map['placeName'],
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      placeId: map['placeId'],
      placeFormattedAddress: map['placeFormattedAddress'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressModel(placeName: $placeName, latitude: $latitude, longitude: $longitude, placeId: $placeId, placeFormattedAddress: $placeFormattedAddress)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressModel &&
        other.placeName == placeName &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.placeId == placeId &&
        other.placeFormattedAddress == placeFormattedAddress;
  }

  @override
  int get hashCode {
    return placeName.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        placeId.hashCode ^
        placeFormattedAddress.hashCode;
  }
}
