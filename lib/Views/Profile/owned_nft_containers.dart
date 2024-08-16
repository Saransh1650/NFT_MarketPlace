import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/GetX/wallet_connect_config.dart';

class OwnedNftContainer extends StatelessWidget {
  final String price;
  final BigInt imageUrl;
  const OwnedNftContainer({super.key, required this.imageUrl, required this.price});

  @override
  Widget build(BuildContext context) {

WalletConnectConfig controller = Get.put(WalletConnectConfig());

    return 
    
    FutureBuilder<dynamic>(
      future: controller.tokenURI(imageUrl), // Call the function to fetch the image URL
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Display a loading indicator while waiting
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Display an error message if something went wrong
        } else if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(snapshot.data![0]), fit: BoxFit.fill),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(35, 0, 0, 0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "$price Eth",
                                      style: GoogleFonts.balooDa2(
                                          textStyle: const TextStyle(
                                              color: Colors.white),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Price",
                                      style: GoogleFonts.balooDa2(
                                          textStyle: const TextStyle(
                                              color: Colors.white),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ); // Display the image when the URL is available
        } else {
          return Text('No image available'); // Handle the case where there's no data
        }
      },
    )
    
    ;
  }
}
