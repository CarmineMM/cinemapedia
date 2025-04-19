import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  /// .env = THE_MOVIEDB_KEY
  static String theMovieDdKey = dotenv.env['THE_MOVIEDB_KEY'] ?? '';
}
