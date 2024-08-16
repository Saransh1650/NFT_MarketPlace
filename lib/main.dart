import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_app/Views/Launch%20Screen/launch_screen.dart';
import 'package:test_app/Views/Main%20Screen/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Scaffold(
        body:LaunchScreen(),
      ),
    );
  }
}
