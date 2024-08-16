import 'dart:async';
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Data/nft.dart';
import 'package:test_app/GetX/wallet_connect_config.dart';
import 'package:test_app/Views/Main%20Screen/nft_containers.dart';
import 'package:test_app/Views/Zoomed%20View/zoomed_nft_view.dart';

class NftContainerList extends StatelessWidget {
  const NftContainerList({super.key});

  @override
  Widget build(BuildContext context) {
    WalletConnectConfig controller = Get.put(WalletConnectConfig());

    Future<String> url(index) async {
      controller.getNft();
      var imageurl = await controller.tokenURI(controller.mainFeed[index][0]);
      return imageurl[0];
    }

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Obx(() {
          return ListView.builder(
            itemCount: controller.mainFeed.length,
            itemBuilder: (context, index) {
              return NftContainers(
                  tokenId: controller.mainFeed[index][0].toString(),
                  owner: controller.mainFeed[index][1].toString(),
                  desc: controller.mainFeed[index][7].toString(),
                  image: url(index),
                  price: controller.mainFeed[index][3].toString(),
                  name: controller.mainFeed[index][6].toString(),
                  volume: controller.mainFeed[index][4].toString());
            },

            // NftContainers(
            //   image: "assets/7.gif",
            //   name: "Stud Ape",
            //   price: "1.52",
            //   volume: "235",),
            //   NftContainers(
            //   image: "assets/5.webp",
            //   name: "THE DOG",
            //   price: "2.75",
            //   volume: "500",),
            //   NftContainers(
            //   image: "assets/3.gif",
            //   name: "Rainbow Man",
            //   price: "1.25",
            //   volume: "400",),
          );
        }),
      ),
    );
  }
}
