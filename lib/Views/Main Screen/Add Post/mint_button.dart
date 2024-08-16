import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/GetX/uploading_file.dart';
import 'package:test_app/GetX/wallet_connect_config.dart';

class MintButton extends StatelessWidget {
  final String title, decs, mints, price;
  const MintButton({super.key, required this.title, required this.decs, required this.mints, required this.price});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(FileUpload());
    final w3c = Get.put(WalletConnectConfig());
    return AnimatedButton(
            isReverse: true,
            animatedOn: AnimatedOn.onTap,
            borderColor: Colors.blueAccent,
            backgroundColor: Colors.white,
            selectedBackgroundColor: Colors.black,
            borderRadius: 10,
            width: 200,
            text: 'Mint',
            selectedTextColor: Colors.blueAccent,
            transitionType: TransitionType.LEFT_TO_RIGHT,
            textStyle: GoogleFonts.balooDa2(
          textStyle: const TextStyle(color: Colors.black),
          fontSize: 25,
          fontWeight: FontWeight.bold),
            onPress: () async {
              try {
              if(controller.imageUrl == ""){
                Get.snackbar("No Image Selected", "Please select an image or Gif from your gallery to continue");
              }
              else{
                print(mints);
                print(title);
                print("Image selected");
                w3c.createNft(title, decs, controller.imageUrl.value, BigInt.parse(mints), BigInt.parse(price));
              }
                
              } catch (e,s) {
                print("erroe $e");
                print(s);
              }
            },
          );
  }
}