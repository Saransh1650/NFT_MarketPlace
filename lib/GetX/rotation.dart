import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class Rotating extends GetxController{
  late FixedExtentScrollController controller;
  late Timer _timer;
  RxDouble _currentIndex = RxDouble(0);

  @override
  void onInit() {
    // TODO: implement onInit
     controller = FixedExtentScrollController();
    _startAutoScroll(5);
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll(5));
    super.onInit();
  }
  

  void _startAutoScroll(int num) {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (controller.hasClients) {
        _currentIndex.value = (_currentIndex.value + 3) % num;
      
      controller.animateToItem(
        _currentIndex.value.toInt(),
        duration: Duration(milliseconds: 3000),
        curve: Curves.easeInOutCubicEmphasized,
      );
      }
    });
  }

@override
  void onClose() {
     _timer.cancel();
    controller.dispose();
    super.dispose();
    super.onClose();
  }
  
}