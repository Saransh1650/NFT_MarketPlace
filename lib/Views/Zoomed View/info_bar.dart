import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoBar extends StatelessWidget {
  final String price, volume, owned;
  const InfoBar({super.key, required this.price, required this.volume, required this.owned});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 7 / 8,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(volume, style: GoogleFonts.balooDa2(
                            textStyle: const TextStyle(color: Colors.white),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),),

                            Text("Items", style: GoogleFonts.balooDa2(
                            textStyle: const TextStyle(color: Colors.white),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),)
                ],
              ),
              Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$price Eth",
                style: GoogleFonts.balooDa2(
                    textStyle: const TextStyle(color: Colors.white),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Price",
                style: GoogleFonts.balooDa2(
                    textStyle: const TextStyle(color: Colors.white),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                child: Text(
                  owned,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.balooDa2(
                
                      textStyle: const TextStyle(color: Colors.white),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Owner",
                style: GoogleFonts.balooDa2(
                    textStyle: const TextStyle(color: Colors.white),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
            ],
          ),
    );
  }
}