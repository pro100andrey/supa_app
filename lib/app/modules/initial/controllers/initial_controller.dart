import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class InitialController extends GetxController {
  final bool isUserLoggedIn = false;

  @override
  void onReady() {
    super.onReady();

    unawaited(_initNavigationFlow());
  }

  Future<void> _initNavigationFlow() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));

    await Get.offNamed<dynamic>(
      isUserLoggedIn ? Routes.home : Routes.login,
    );
  }
}
