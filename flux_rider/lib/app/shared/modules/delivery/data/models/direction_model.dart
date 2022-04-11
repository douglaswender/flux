import '../../domain/entities/direction.dart';

class DirectionModel extends Direction {
  DirectionModel({
    String? distanceText,
    String? durationText,
    int? distanceValue,
    int? durationValue,
    String? encodedPoints,
  }) : super(
          distanceText: distanceText,
          distanceValue: distanceValue,
          durationText: durationText,
          durationValue: durationValue,
          encondedPoints: encodedPoints,
        );
}
