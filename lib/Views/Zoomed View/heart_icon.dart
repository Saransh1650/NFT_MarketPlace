import 'dart:ui';

import 'package:flutter/material.dart';

class HeartIcon extends StatelessWidget {
  const HeartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              SizedBox(
            width: 10,
          )
      ],
    )
          ;
  }
}