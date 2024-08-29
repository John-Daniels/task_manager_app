// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigService {
  static Future init() async {
    await dotenv.load(fileName: '.env');
  }
}

// var networkApi = 'http://192.168.43.28:5000/api/v1';

class Config {
  // static final API_URL = networkApi;
  static final API_URL = dotenv.env['API_URL']!;
  //
}
