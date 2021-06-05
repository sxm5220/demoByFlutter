import 'package:demo04/counter.dart';
import 'package:demo04/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个页面'),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondPage();
                    },
                  ),
                );
              },
              child: Text('下一个页面'))
        ],
      ),
      body: Center(
        child: Text(
            '${context.watch<Counter>().count}'), //Text('${Provider.of<Counter>(context).count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Provider.of<Counter>(context).increment(); //调用方法
          context.read<Counter>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
