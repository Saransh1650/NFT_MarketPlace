import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleNft extends StatelessWidget {
  final String title;
  const TitleNft({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                   title,
                    style: GoogleFonts.balooDa2(
                        textStyle: const TextStyle(color: Colors.black),
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
  }
}