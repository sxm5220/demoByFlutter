import 'package:flutter/material.dart';

import '../../home/sy_homeDetail_page.dart';

class SyVerticalPlaceItemWidget extends StatelessWidget {
  const SyVerticalPlaceItemWidget(
      {super.key, required this.index, required this.places});
  final int index;
  final List places;
  @override
  Widget build(BuildContext context) {
    Map place = places[index];
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        child: SizedBox(
          height: 90.0,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  "${place["img"]}",
                  height: 80.0,
                  width: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15.0),
              SizedBox(
                height: 80.0,
                width: MediaQuery.of(context).size.width - 140.0,
                child: ListView(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${place["name"]}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 3.0),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 15.0,
                          color: Colors.blueGrey[300],
                        ),
                        const SizedBox(width: 3.0),
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
                      ],
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
