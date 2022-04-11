class Place {
  final String placeId;
  final String mainText;
  final String? secondaryText;

  Place({
    required this.placeId,
    required this.mainText,
    this.secondaryText,
  });
}
