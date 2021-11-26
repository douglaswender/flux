import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String mapKey = _get('MAP_KEY');

  static String _get(String name) => dotenv.env["MAP_KEY"] ?? '';

  static String urlImagePackage =
      "https://media.istockphoto.com/photos/carboard-box-wclippping-path-picture-id157318026?b=1&k=20&m=157318026&s=170667a&w=0&h=_Inj7xHJy2xdVJKqHmnCrEBmc5B22XpdDdr25GKmVYc=";

  static String globalMapKey = "AIzaSyAvE2HpMTWBmsImwO33L-e7yudiTlzLJLg";

  static String placeUrl(String placeName) =>
      "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$globalMapKey&sessiontoken=123254251&components=country:BR&location=-10.7278833,-62.2509347&radius=20000&language=pt-BR";

  static String placeDetailsUrl(String placeId) =>
      "https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$globalMapKey";
}
