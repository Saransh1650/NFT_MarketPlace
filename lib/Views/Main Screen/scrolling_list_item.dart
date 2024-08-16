import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScrollingListItem extends StatelessWidget {
  final String name;
  const ScrollingListItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: Container(
        
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white),
              child: Center(
                  child: Text(
                name,
                style: GoogleFonts.balooDa2(
                    textStyle: TextStyle(color: Colors.black),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )),
            ),
    );
  }
}