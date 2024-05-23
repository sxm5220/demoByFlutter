import 'package:demo23/widgets/stacked_row.dart';
import 'package:flutter/material.dart';

import '../models/trip_data.dart';

class HomeTripCardLg extends StatelessWidget {
  const HomeTripCardLg({
    super.key,
    required this.data,
    required this.isSmall,
  });

  final TripData data;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    //print("tag:${data.id} -${data.user.uid}");
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          Hero(
            tag: 'bg${data.id}',
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(data.imagePath),
                  colorFilter:
                      const ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: 'date${data.id}',
                        child: Text(
                          data.date,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      FractionallySizedBox(
                        widthFactor: 0.8,
                        child: Hero(
                          tag: 'title${data.id}',
                          child: Text(
                            data.title,
                            style: isSmall
                                ? Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  StackedRow(
                    items: data.userList
                        .map(
                          (user) => Hero(
                            tag: "user${data.id}${user.uid}",
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                  radius: isSmall ? 10 : 15,
                                  backgroundImage: NetworkImage(user.img)),
                            ),
                          ),
                        )
                        .toList(),
                    size: isSmall ? 25 : 35,
                    direction: TextDirection.rtl,
                    xShift: isSmall ? 10 : 15,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
