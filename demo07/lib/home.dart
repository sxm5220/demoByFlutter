import 'package:demo07/screens/card_column_screen.dart';
import 'package:demo07/screens/card_grid_screen.dart';
import 'package:demo07/screens/card_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardListScreen(),
                  ),
                );
              },
              child: Text('List Card Test'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardGridScreen(),
                  ),
                );
              },
              child: Text('Grid Card Test'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardColumnScreen(),
                  ),
                );
              },
              child: Text('Column Card Test'),
            ),
          ],
        ),
      ),
    );
  }
}
