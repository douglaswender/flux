import 'package:flux_client/app/modules/home/domain/entities/direction.dart';

class DirectionModel extends Direction {
  DirectionModel({
    String? distanceText,
    String? durationText,
    int? distanceValue,
    int? durationValue,
    String? encodedPoints,
  }) : super(
          distanceText: distanceText,
          distanceValue: durationValue,
          durationText: durationText,
          durationValue: distanceValue,
          encondedPoints: encodedPoints,
        );
}
