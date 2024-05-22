import 'package:demo23/trip_details_page.dart';
import 'package:demo23/widgets/home_trip_card.dart';
import 'package:demo23/widgets/home_trip_card_lg.dart';
import 'package:demo23/widgets/stacked_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gen/assets.gen.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage(Assets.images.ellipse36.path),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: Text(
                'Your trips',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Current trip'.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildMainTripCard(context),
            const SizedBox(height: 32),
            _buildTripSmallCards(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Stack _buildMainTripCard(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () => _openTripDetails(context),
          child: const HomeTripCardLg(),
        ),
        Positioned(
          bottom: -20,
          left: 20,
          // alignment: Alignment.bottomCenter,
          child: StackedRow(
            items: [
              Assets.images.ellipse36.path,
              Assets.images.ellipse39.path,
              Assets.images.ellipse37.path,
            ]
                .map(
                  (e) => Hero(
                    tag: e,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(e),
                    ),
                  ),
                )
                .toList(),
            size: 42,
            direction: TextDirection.rtl,
            xShift: 10,
          ),
        )
      ],
    );
  }

  void _openTripDetails(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const TripDetailsPage();
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

  Widget _buildTripSmallCards() {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: 220,
      ),
      shrinkWrap: true,
      children: const [
        HomeTripCard(
          imagePath:
              'https://images.pexels.com/photos/2377432/pexels-photo-2377432.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          date: 'Mar 7-21',
          title: 'Road trips over Italian Riviera',
        ),
        HomeTripCard(
          imagePath:
              'https://images.pexels.com/photos/1615807/pexels-photo-1615807.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          date: 'Jan 7-23',
          title: 'Weekend in Lisbon',
        ),
        HomeTripCard(
          imagePath:
              'https://images.pexels.com/photos/1559908/pexels-photo-1559908.jpeg?auto=compress&cs=tinysrgb&w=600',
          date: 'Mar 7-21',
          title: 'Road trips over Italian Riviera',
        ),
        HomeTripCard(
          imagePath:
              'https://images.pexels.com/photos/1550348/pexels-photo-1550348.jpeg?auto=compress&cs=tinysrgb&w=600',
          date: 'Mar 7-21',
          title: 'Road trips over Italian Riviera',
        )
      ],
    );
  }
}
