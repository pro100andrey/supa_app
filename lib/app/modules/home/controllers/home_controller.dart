import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    await Supabase.instance.client.auth.signOut();
  }

  void increment() => count.value++;
}
