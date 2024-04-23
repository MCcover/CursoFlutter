import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDbKey = dotenv.env['API_KEY_MOVIE_DB'] ?? 'No Hay API Key';
  static String theMovieDbJWT = dotenv.env['API_JWT'] ?? 'No Hay API Key';
}
