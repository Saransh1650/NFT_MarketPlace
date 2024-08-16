import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  var isLoading = false.obs;

  void showLoading() {
    isLoading.value = true;
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }

  void hideLoading() {
    if (isLoading.value) {
      isLoading.value = false;
      Get.back();
    }
  }
}
