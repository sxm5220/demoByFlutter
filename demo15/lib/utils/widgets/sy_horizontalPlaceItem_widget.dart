import 'package:demo15/home/sy_homeDetail_page.dart';
import 'package:flutter/material.dart';

class SyHorizontalPlaceItemWidget extends StatelessWidget {
  const SyHorizontalPlaceItemWidget(
      {super.key, required this.index, required this.places});
  final int index;
  final List places;

  @override
  Widget build(BuildContext context) {
    Map place = places.reversed.toList()[index];
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        child: SizedBox(
          height: 280.0,
          width: 140.0,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "${place["img"]}",
                  height: 180.0,
                  width: 140.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${place["name"]}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 3.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${place["location"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                    color: Colors.blueGrey[300],
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 5.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${place["price"]}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return SyHomeDetailPage(
                  place: place,
                  images: places,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
