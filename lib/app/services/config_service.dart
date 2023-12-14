import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  late final String url;
  late final String anonKey;

  /// Initializes the service.
  Future<ConfigService> init() async {
    await _loadConfig();

    return this;
  }

  Future<void> _loadConfig() async {
    await dotenv.load();

    url = dotenv.env['SUPABASE_URL']!;
    anonKey = dotenv.env['SUPABASE_ANON_KEY']!;
  }
}
