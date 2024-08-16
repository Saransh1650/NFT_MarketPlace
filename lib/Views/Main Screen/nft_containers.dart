import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Views/Zoomed%20View/zoomed_nft_view.dart';

// ignore: must_be_immutable
class NftContainers extends StatelessWidget {
  final String price, name, volume, desc, owner, tokenId;
  Future<String> image;
  NftContainers(
      {super.key,
      required this.image,
      required this.price,
      required this.name,
      required this.volume,
      required this.desc,
      required this.owner,
      required this.tokenId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: image, // Call the function to fetch the image URL
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 70,
            width: 50,
            padding:const EdgeInsets.fromLTRB(150, 0, 150, 0),
            child:const CircularProgressIndicator()); // Display a loading indicator while waiting
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style:const TextStyle(color: Colors.white),
          ); // Display an error message if something went wrong
        } else if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(snapshot.data!), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.grey[300],
                border: Border.all(
                  width: 1.0,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(
                            height: 70,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  50,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:EdgeInsets.all(8.0),
                                  child: Image(
                                      image: AssetImage("assets/eth.png")),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Spacer(),
                                    const Text(
                                      "Volume",
                                    ),
                                    Text(volume,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)
                                        //
                                        ),
                                    const Spacer()
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                color: Colors.white.withOpacity(0.5)),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border_sharp)),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.balooDa2(
                            textStyle: const TextStyle(color: Colors.white),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                color: Colors.white.withOpacity(0.5)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Current Price"),
                                Text(
                                  "$price Eth",
                                  style: GoogleFonts.balooDa2(
                                      textStyle:
                                          const TextStyle(color: Colors.white),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                color: Colors.white.withOpacity(0.5)),
                            child: IconButton(
                                onPressed: () {
                                  Get.to(() => ZoomedView(
                                        tokenId: tokenId,
                                        owner: owner,
                                        desc: desc,
                                        image: snapshot.data!,
                                        name: name,
                                        price: price,
                                        volume: volume,
                                      ));
                                },
                                icon: const Icon(Icons.arrow_forward)),
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
          return const Text(
              'No image available'); // Handle the case where there's no data
        }
      },
    );
  }
}
