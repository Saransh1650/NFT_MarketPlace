import 'package:flutter/material.dart';

class LargeImage extends StatelessWidget {
  final String image;
   LargeImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 3/5,
        width: MediaQuery.of(context).size.width,
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ));
  }
}