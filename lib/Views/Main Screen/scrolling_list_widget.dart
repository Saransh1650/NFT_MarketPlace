import 'package:flutter/material.dart';
import 'package:test_app/Views/Main%20Screen/scrolling_list_item.dart';

class ScrollingListWidget extends StatelessWidget {
  const ScrollingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ScrollingListItem(name: "Recent",),
          ScrollingListItem(name: "Trending",),
           ScrollingListItem(
            name: "Top Art",
          ),
           ScrollingListItem(
            name: "New",
          ),
           ScrollingListItem(
            name: "Popular",
          ),
           ScrollingListItem(
            name: "On Sale",
          ),
          ScrollingListItem(
            name: "In Demand",
          ),
        ],
      ),
    );
  }
}