import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDecoratedContainers extends StatelessWidget {
  final String value,title;
  const ProfileDecoratedContainers({super.key, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 2 / 5,
                    decoration: const BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Center(
                            child: Text("$value",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.balooDa2(
                                    textStyle: const TextStyle(color: Colors.white),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Text(title, style: GoogleFonts.balooDa2(
                                textStyle: const TextStyle(color: Colors.white),
                                fontSize: 15,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                );
  }
}