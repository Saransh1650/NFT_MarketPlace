import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      width: MediaQuery.of(context).size.width - 20,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 43, 43, 51),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: const Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Icon(Icons.sort, color: Colors.white),
          SizedBox(width: 10),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search for your favorite NFT !",
                hintStyle:
                    TextStyle(color: Color.fromARGB(255, 127, 128, 138))),
          ))
        ],
      ),
    );
  }
}