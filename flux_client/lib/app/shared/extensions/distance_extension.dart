extension DistanceIntExtencion on int? {
  String quilometers() => this! < 1000
      ? "${(this!).toStringAsFixed(2)} m"
      : "${(this! / 1000).toStringAsFixed(2)} km";
}
