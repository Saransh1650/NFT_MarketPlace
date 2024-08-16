// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/GetX/uploading_file.dart';
import 'package:test_app/GetX/wallet_connect_config.dart';
import 'package:test_app/Views/Main%20Screen/Add%20Post/image_container.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({super.key});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final desc = TextEditingController();
    final mints = TextEditingController();
    final price = TextEditingController();
    final controller = Get.put(FileUpload());
    final w3c = Get.put(WalletConnectConfig());

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 5/9,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [ImageViewContainer()],
            ),
            SizedBox(height: 10),
              
            //title
              
            TextField(
              controller: title,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Title of NFT",
                  hintStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 10,
            ),
              
            // desc
              
            TextField(
              controller: desc,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  // mints
              
                  child: TextField(
                    controller: mints,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "No. of Mints",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  // price
              
                  child: TextField(
                    controller: price,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Price",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AnimatedButton(
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
                  if (controller.imageUrl == "") {
                    Get.snackbar("No Image Selected",
                        "Please select an image or Gif from your gallery to continue");
                  } else {
                    print(mints.text);
                    print(price.text);
                    print("Image selected");
                    w3c.createNft(
                        title.text,
                        desc.text,
                        controller.imageUrl.value,
                        BigInt.tryParse(mints.text)!,
                        BigInt.tryParse(price.text)!);
                  }
                } catch (e, s) {
                  print("erroe $e");
                  print(s);
                }
              },
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
