import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import '../utils/widgets/sy_horizontalPlaceItem_widget.dart';
import '../utils/widgets/sy_verticalPlaceItem_widget.dart';

class SyHomePage extends StatelessWidget {
  SyHomePage({super.key});
  List places = [
    {
      "name": "Hotel Dolah Amet & Suites Hotel Dolah Amet & Suites",
      "img": "assets/images/1.jpeg",
      "price": r"$100/night",
      "location": "London, England",
      "details": "Pellentesque in ipsum id orci porta dapibus. "
          "Nulla porttitor accumsan tincidunt. Donec rutrum "
          "congue leo eget malesuada. "
          "\n\nPraesent sapien massa, convallis a pellentesque "
          "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
          "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
          "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
          "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
          "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
    },
    {
      "name": "Beach Mauris Blandit",
      "img": "assets/images/2.jpeg",
      "price": r"$100/night",
      "location": "Lisbon, Portugal",
      "details": "Pellentesque in ipsum id orci porta dapibus. "
          "Nulla porttitor accumsan tincidunt. Donec rutrum "
          "congue leo eget malesuada. "
          "\nPraesent sapien massa, convallis a pellentesque "
          "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
          "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
          "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
          "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
          "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
    },
    {
      "name": "Ipsum Restaurant",
      "img": "assets/images/3.jpeg",
      "price": r"$100/night",
      "location": "Paris, France",
      "details": "Pellentesque in ipsum id orci porta dapibus. "
          "Nulla porttitor accumsan tincidunt. Donec rutrum "
          "congue leo eget malesuada. "
          "\n\nPraesent sapien massa, convallis a pellentesque "
          "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
          "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
          "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
          "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
          "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
    },
    {
      "name": "Curabitur Beach",
      "img": "assets/images/4.jpeg",
      "price": r"$100/night",
      "location": "Rome, Italy",
      "details": "Pellentesque in ipsum id orci porta dapibus. "
          "Nulla porttitor accumsan tincidunt. Donec rutrum "
          "congue leo eget malesuada. "
          "\nPraesent sapien massa, convallis a pellentesque "
          "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
          "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
          "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
          "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
          "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
    },
    {
      "name": "Tincidunt Pool",
      "img": "assets/images/5.jpeg",
      "price": r"$100/night",
      "location": "Madrid, Spain",
      "details": "Pellentesque in ipsum id orci porta dapibus. "
          "Nulla porttitor accumsan tincidunt. Donec rutrum "
          "congue leo eget malesuada. "
          "\nPraesent sapien massa, convallis a pellentesque "
          "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
          "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
          "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
          "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
          "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 13, end: 13),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_none_rounded,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Where are you \ngoing?",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchBar(),
          ),
          buildHorizontalList(context),
          const SizedBox(height: 10),
          const Divider(height: 1),
          buildVerticalList(),
        ],
      ),
    );
  }

  buildHorizontalList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
      height: 300.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          return SyHorizontalPlaceItemWidget(
            index: index,
            places: places,
          );
        },
      ),
    );
  }

  buildVerticalList() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          return SyVerticalPlaceItemWidget(
            index: index,
            places: places,
          );
        },
      ),
    );
  }
}
