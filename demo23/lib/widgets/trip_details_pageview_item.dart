import 'package:demo23/widgets/trip_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/trip_data.dart';

class TripDetailsPageViewItem extends StatelessWidget {
  TripDetailsPageViewItem({super.key, required this.data});
  final TripData data;
  final tripDataList = [
    const TripData(
      id: "3",
      user: UserData(
          uid: '3',
          name: "王维",
          img:
              "https://q8.itc.cn/q_70/images03/20240517/71b47444c2aa467eb464c633b088bc87.jpeg"),
      title: 'Media',
      date: 'May 6-5',
      imagePath:
          'https://images.pexels.com/photos/1615807/pexels-photo-1615807.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      tripAdditionalInfos: [
        (title: 'Photos', number: '257'),
        (title: 'Videos', number: '14'),
      ],
      userList: [
        UserData(
            uid: "2",
            name: "白居易",
            img:
                "https://q4.itc.cn/q_70/images03/20240405/0fe4005840664f30b76f1a63909a5489.jpeg"),
        UserData(
            uid: "1",
            name: "李白",
            img:
                "https://q6.itc.cn/q_70/images03/20240514/edff7fc31d05404cb97be496dd7785d2.jpeg")
      ],
    ),
    const TripData(
      id: "2",
      user: UserData(
          uid: '2',
          name: "白居易",
          img:
              "https://q4.itc.cn/q_70/images03/20240405/0fe4005840664f30b76f1a63909a5489.jpeg"),
      title: 'SubTree',
      date: 'May 1-5',
      imagePath:
          'https://images.pexels.com/photos/1559908/pexels-photo-1559908.jpeg?auto=compress&cs=tinysrgb&w=600',
      tripAdditionalInfos: [(title: 'Over 11 days', number: '1,457 km')],
      userList: [
        UserData(
            uid: "3",
            name: "王维",
            img:
                "https://q8.itc.cn/q_70/images03/20240517/71b47444c2aa467eb464c633b088bc87.jpeg"),
        UserData(
            uid: "1",
            name: "李白",
            img:
                "https://q6.itc.cn/q_70/images03/20240514/edff7fc31d05404cb97be496dd7785d2.jpeg")
      ],
    ),
    const TripData(
      id: "1",
      user: UserData(
          uid: '1',
          name: "李白",
          img:
              "https://q6.itc.cn/q_70/images03/20240514/edff7fc31d05404cb97be496dd7785d2.jpeg"),
      title: 'Photos',
      date: 'May 6-22',
      imagePath:
          'https://images.pexels.com/photos/1550348/pexels-photo-1550348.jpeg?auto=compress&cs=tinysrgb&w=600',
      tripAdditionalInfos: [
        (title: 'Photos', number: '257'),
        (title: 'Videos', number: '14'),
      ],
      userList: [
        UserData(
            uid: "2",
            name: "白居易",
            img:
                "https://q4.itc.cn/q_70/images03/20240405/0fe4005840664f30b76f1a63909a5489.jpeg"),
        UserData(
            uid: "3",
            name: "王维",
            img:
                "https://q8.itc.cn/q_70/images03/20240517/71b47444c2aa467eb464c633b088bc87.jpeg"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimationLimiter(
        child: Container(
          // color: Colors.red.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              childAnimationBuilder: (child) => SlideAnimation(
                // horizontalOffset: 50,
                verticalOffset: 30,
                child: child,
              ),
              // delay: Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 400),
              children: [
                buildHiddenHeader(context),
                const SizedBox(height: 16),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: tripDataList.length,
                    itemBuilder: (context, index) =>
                        TripDataCard(tripData: tripDataList[index]),
                  ),
                ),
                /*const SizedBox(height: 16),
                const Text('TRIP BOARD', style: TextStyle()),
                const SizedBox(height: 8),
                buildMessageRow(
                    message:
                        'What a trip! Thanks for all the memories! Whats next?',
                    imagePath: Assets.images.ellipse53.path),
                const SizedBox(height: 12),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildMessageRow({required String imagePath, required String message}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black26, width: 2),
            ),
            padding: const EdgeInsets.all(16),
            // child: const Text('What a trip! Thanks for all the memories! Whats next?'),
            child: Text(message),
          ),
        )
      ],
    );
  }

  Widget buildHiddenHeader(BuildContext context) {
    return Opacity(
      opacity: 0,
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'May 5-15',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 16),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Text(
                  'Riding through the lands of the legends',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Theme(
            data: ThemeData.dark()
                .copyWith(textTheme: GoogleFonts.montserratTextTheme()),
            child: Wrap(
              children: data.userList
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: Material(
                        color: Colors.transparent,
                        child: Theme(
                          data: ThemeData.dark().copyWith(
                              textTheme: GoogleFonts.montserratTextTheme()),
                          child: Chip(
                            label: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(e.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                            ),
                            avatar: CircleAvatar(
                              backgroundImage: NetworkImage(e.img),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
