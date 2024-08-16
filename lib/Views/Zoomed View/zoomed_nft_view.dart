import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';
import 'package:test_app/GetX/wallet_connect_config.dart';
import 'package:test_app/Views/Zoomed%20View/description.dart';
import 'package:test_app/Views/Zoomed%20View/heart_icon.dart';
import 'package:test_app/Views/Zoomed%20View/info_bar.dart';
import 'package:test_app/Views/Zoomed%20View/large_image.dart';
import 'package:test_app/Views/Zoomed%20View/title_nft.dart';

class ZoomedView extends StatelessWidget {
  final String name, price, volume, image, desc, owner, tokenId;
  ZoomedView(
      {super.key,
      required this.name,
      required this.price,
      required this.volume,
      required this.image,
      required this.desc,
      required this.owner,
      required this.tokenId});

  @override
  Widget build(BuildContext context) {
    WalletConnectConfig controller = Get.put(WalletConnectConfig());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [HeartIcon()],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            LargeImage(
              image: image,
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 3 / 5 - 50,
                left: MediaQuery.of(context).size.width / 16,
                child: InfoBar(
                  owned: owner,
                  price: price,
                  volume: volume,
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * 3 / 5 + 50,
                child: TitleNft(
                  title: name,
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * 3 / 5 + 100,
                child: Description(desc: desc)),
            Positioned(
                top: MediaQuery.of(context).size.height - 100,
                left: MediaQuery.of(context).size.width / 6,
                child: SliderButton(
                    boxShadow: BoxShadow(blurRadius: 10),
                    shimmer: false,
                    baseColor: Colors.black26,
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    buttonColor: Colors.white,
                    buttonSize: 60,
                    action: () async {
                      ///Do something here OnSlide
                      ///
                      ///
                      ///@dev
                      controller.buyNft(BigInt.tryParse(tokenId)!);
                    },
                    label: Text(
                      "$price Eth",
                      style: GoogleFonts.balooDa2(
                          textStyle: const TextStyle(color: Colors.white),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    icon: Icon(
                      Icons.double_arrow_rounded,
                      color: Colors.black,
                    )))
          ],
        ),
      ),
    );
  }
}
