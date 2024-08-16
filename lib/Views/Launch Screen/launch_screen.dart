import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/GetX/wallet_connect_config.dart';
import 'package:test_app/Views/Launch%20Screen/rotating_cube.dart';
import 'package:test_app/Views/Main%20Screen/main_screen.dart';

import 'package:web3modal_flutter/web3modal_flutter.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalletConnectConfig());
    return Container(
      padding: const EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 127, 44, 229)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              "Find and Collect Latest NFT",
              style: GoogleFonts.balooDa2(
                textStyle: TextStyle(color: Colors.white),
                fontSize: 48,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Collect, Buy, Sell the amazing NFTs at across the globe effortlessly and Quickly",
              style: GoogleFonts.balooDa2(
                textStyle: TextStyle(color: Colors.white),
                fontSize: 18,
                fontStyle: FontStyle.normal,
              ),
            ),
            Container(height: 400, child: RotatingCube()),
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(173, 179, 191, 1.0),
                    blurRadius: 20.0,
                    offset: Offset(0.0, 0.0))
              ]),
              child: W3MConnectWalletButton(service: controller.w3mService),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                height: 30,
                child: GestureDetector(
                    onTap: () {
                      print("Tapped");
                      if (controller.w3mService.isConnected) {
                        Get.to(()=> const MainScreen());
                      } else {
                        Get.snackbar("Wallet not connected",
                            "Please connect your web3 wallet in order to access the application");
                      }
                      print("object");
                    },
                    child: Text(
                      "Enter the app ->",
                      style: GoogleFonts.balooDa2(
                        textStyle: const TextStyle(color: Colors.white),
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
