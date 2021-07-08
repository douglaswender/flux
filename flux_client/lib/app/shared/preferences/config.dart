import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String mapKey = _get('MAP_KEY');

  static String _get(String name) => dotenv.env["MAP_KEY"] ?? '';
}
