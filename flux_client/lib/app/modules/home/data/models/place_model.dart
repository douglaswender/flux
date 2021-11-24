import 'package:flux_client/app/modules/home/domain/entities/place.dart';

class PlaceModel extends Place {
  PlaceModel({
    required String placeId,
    required String mainText,
    String? secondaryText,
  }) : super(
          placeId: placeId,
          mainText: mainText,
          secondaryText: secondaryText,
        );

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    String placeId = json['place_id'];
    String mainText = json['structured_formatting']['main_text'];
    String secondaryText = json['structured_formatting']['secondary_text'];

    return PlaceModel(
      placeId: placeId,
      mainText: mainText,
      secondaryText: secondaryText,
    );
  }
}
