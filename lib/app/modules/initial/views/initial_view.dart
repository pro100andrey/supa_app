import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/initial_controller.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
