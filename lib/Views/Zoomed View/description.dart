import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  final String desc;
  const Description({super.key, required this.desc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Text(
                    desc,
                    style: GoogleFonts.balooDa2(
                      textStyle: const TextStyle(color: Colors.black),
                      fontSize: 15,
                    ),
                  ),
                ),
              );
  }
}