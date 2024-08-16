import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageContainer extends StatelessWidget {
  final String image;
  ImageContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(173, 179, 191, 1.0),
              blurRadius: 20.0,
              offset: Offset(0.0, -5.0))
        ]),
        height: 300,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
