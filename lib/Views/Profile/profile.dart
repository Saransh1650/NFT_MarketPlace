import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/GetX/wallet_connect_config.dart';
import 'package:test_app/Views/Profile/decorated_containers_profile.dart';
import 'package:test_app/Views/Profile/owned_nft_containers.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalletConnectConfig());
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 30, 36),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 29, 30, 36),
        ),
        child: Column(
          children: [
            // ElevatedButton(onPressed: ()async{
            //   await controller.getNft();
            // }
            // , child: Text("Press")),
             ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/profile.webp",
                  height: 100,
                )),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileDecoratedContainers(
                  title: "Address",
                  value: "${controller.w3mService.session!.address}",
                ),
                ProfileDecoratedContainers(value: "3", title: "Nft(s) Owned")
              ],
            ),

            FutureBuilder<dynamic>(
      future: controller.displayOwnedNfts(), // Call the function to fetch the image URL
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Display a loading indicator while waiting
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Display an error message if something went wrong
        } else if (snapshot.hasData) {
          return Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return OwnedNftContainer(imageUrl: BigInt.parse("${snapshot.data?[index][0]}"), price: snapshot.data?[index][4].toString() ?? "",);
                      },
                    ),
                  ); // Display the image when the URL is available
        } else {
          return Text('No image available'); // Handle the case where there's no data
        }
      },
    )

              ],
        ),
      ),
    );
  }
}
