import 'package:demo23/trip_details_page.dart';
import 'package:demo23/widgets/home_trip_card_lg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/trip_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.montserratTextTheme().apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://q6.itc.cn/q_70/images03/20240514/edff7fc31d05404cb97be496dd7785d2.jpeg'),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  final tripDataList = [
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
      id: "4",
      user: UserData(
          uid: '4',
          name: "周杰伦",
          img:
              "https://q8.itc.cn/q_70/images03/20240517/71b47444c2aa467eb464c633b088bc87.jpeg"),
      title: 'Media',
      date: 'May 1-1',
      imagePath:
          'https://img2.baidu.com/it/u=1375018841,385606541&fm=253&fmt=auto&app=138&f=JPEG?w=281&h=499',
      tripAdditionalInfos: [
        (title: 'Photos', number: '257'),
        (title: 'Videos', number: '14'),
      ],
      userList: [
        UserData(
            uid: "3",
            name: "王维",
            img:
                "https://q8.itc.cn/q_70/images03/20240517/71b47444c2aa467eb464c633b088bc87.jpeg"),
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
      id: "5",
      user: UserData(
          uid: '5',
          name: "六代",
          img:
              "https://q4.itc.cn/q_70/images03/20240405/0fe4005840664f30b76f1a63909a5489.jpeg"),
      title: 'SubTree',
      date: 'May 4-4',
      imagePath:
          'https://img2.baidu.com/it/u=4239371731,2978853425&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1455',
      tripAdditionalInfos: [(title: 'Over 11 days', number: '1,457 km')],
      userList: [
        UserData(
            uid: '4',
            name: "周杰伦",
            img:
                "https://q8.itc.cn/q_70/images03/20240517/71b47444c2aa467eb464c633b088bc87.jpeg"),
        UserData(
            uid: "3",
            name: "王维",
            img:
                "https://q8.itc.cn/q_70/images03/20240517/71b47444c2aa467eb464c633b088bc87.jpeg"),
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
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: Text(
                'Your trips',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Current trip'.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildMainTripCard(context),
            const SizedBox(height: 20),
            _buildTripSmallCards(context),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Stack _buildMainTripCard(BuildContext context) {
    final cardListData = tripDataList.last;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () => _openTripDetails(context, cardListData),
          child: HomeTripCardLg(
            data: cardListData,
            isSmall: false,
          ),
        ),
      ],
    );
  }

  void _openTripDetails(BuildContext context, TripData data) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return TripDetailsPage(
            data: data,
          );
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        opaque: false,
      ),
    );
  }

  Widget _buildTripSmallCards(BuildContext context) {
    final scrollableListData = tripDataList;
    scrollableListData.removeLast();
    return GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          mainAxisExtent: 150,
        ),
        shrinkWrap: true,
        children: scrollableListData
            .map(
              (data) => GestureDetector(
                onTap: () => _openTripDetails(context, data),
                child: HomeTripCardLg(
                  data: data,
                  isSmall: true,
                ),
              ),
            )
            .toList());
  }
}
