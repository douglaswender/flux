import 'package:flux_client/app/modules/home/domain/entities/address.dart';

class AddressModel extends Address {
  AddressModel({
    String? placeName,
    double? latitude,
    double? longitude,
    String? placeId,
    String? placeFormattedAddress,
  }) : super(
          placeName: placeName,
          placeFormattedAddress: placeFormattedAddress,
          placeId: placeId,
          latitude: latitude,
          longitude: longitude,
        );
}
