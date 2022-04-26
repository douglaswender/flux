import 'dart:convert';

class NearbyDriver {
  String? key;
  double? latitude;
  double? longitude;
  NearbyDriver({
    this.key,
    this.latitude,
    this.longitude,
  });

  NearbyDriver copyWith({
    String? key,
    double? latitude,
    double? longitude,
  }) {
    return NearbyDriver(
      key: key ?? this.key,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory NearbyDriver.fromMap(Map<String, dynamic> map) {
    return NearbyDriver(
      key: map['key'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory NearbyDriver.fromJson(String source) =>
      NearbyDriver.fromMap(json.decode(source));

  @override
  String toString() =>
      'NearbyDriver(key: $key, latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NearbyDriver &&
        other.key == key &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => key.hashCode ^ latitude.hashCode ^ longitude.hashCode;
}
