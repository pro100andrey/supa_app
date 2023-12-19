import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> logout() async {
    await Supabase.instance.client.auth.signOut();
  }
}
