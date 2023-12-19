import 'dart:async';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_pages.dart';

class InitialController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    Supabase.instance.client.auth.onAuthStateChange.listen((event) async {
      await _initNavigationFlow();
    });
  }

  Future<void> _initNavigationFlow() async {
    final user = Supabase.instance.client.auth.currentSession?.user;

    await Get.offNamed<dynamic>(
      user != null ? Routes.home : Routes.login,
    );
  }
}
