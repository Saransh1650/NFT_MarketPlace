// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Views/Main%20Screen/Add%20Post/dialog_box.dart';
import 'package:test_app/Views/Main%20Screen/nft_containers_list.dart';
import 'package:test_app/Views/Main%20Screen/scrolling_list_widget.dart';
import 'package:test_app/Views/Main%20Screen/search_bar_widget.dart';
import 'package:test_app/Views/Profile/profile.dart';

import '../../GetX/wallet_connect_config.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
        WalletConnectConfig controller = Get.put(WalletConnectConfig());
       
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
                onCancel: () {
                  controller.getNft();
                },
                content: DialogBox(),
                title: "Create Nft",
                backgroundColor: Colors.black,
                titleStyle: const TextStyle(color: Colors.white));
          },
          backgroundColor: Colors.black,
          child: const Text(
            "+",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      backgroundColor: const Color.fromARGB(255, 29, 30, 36),
      appBar: AppBar(
        actions: [
          IconButton.filled(
            onPressed: () {
              Get.to(() => Profile());
            },
            icon: const Icon(Icons.person),
            color: Colors.white,
          )
        ],
        backgroundColor: const Color.fromARGB(255, 29, 30, 36),
        title: Text(
          'NFT MarketSpace',
          style: GoogleFonts.balooDa2(
              textStyle: const TextStyle(color: Colors.white),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SearchBarWidget(),
            const SizedBox(
              height: 10,
            ),
            const ScrollingListWidget(),
            NftContainerList()
          ],
        ),
      ),
    );
  }
}
