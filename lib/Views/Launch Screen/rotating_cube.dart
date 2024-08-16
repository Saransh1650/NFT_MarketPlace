import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';
import 'package:test_app/GetX/rotation.dart';
import 'package:test_app/Views/Launch%20Screen/image_container.dart';


class RotatingCube extends StatelessWidget {
  const RotatingCube({super.key});

  @override
  Widget build(BuildContext context) {
    Rotating controller = Get.put(Rotating());
    return RotatedBox(
      quarterTurns: 1,
      child: ListWheelScrollView.useDelegate(
        diameterRatio: 2,
        perspective: 0.003,
        // useMagnifier: true,
        physics: AlwaysScrollableScrollPhysics(),
        offAxisFraction: 0.0,
        itemExtent: 300,
        controller: controller.controller,
        childDelegate: ListWheelChildLoopingListDelegate(children: [
          ImageContainer(image: "assets/5.webp"),
          ImageContainer(image: "assets/7.gif"),
          ImageContainer(image: "assets/3.gif"),
          ImageContainer(image: "assets/4.gif"),
          ImageContainer(image: "assets/6.gif"),
        ]),
      ),
    );
  }
}
