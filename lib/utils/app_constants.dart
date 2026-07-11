import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static final String apiKey =
      dotenv.env['API_KEY'] ??
      (throw Exception('API_KEY is missing in .env file'));
}
