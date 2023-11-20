import 'package:flutter/material.dart';
import 'package:get/get.dart';

void warningToast(String text) {
  Get.snackbar(
    'Warning',
    text,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 5),
  );
}

void errorToast(String text) {
  Get.snackbar(
    'Error',
    text,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 5),
  );
}
