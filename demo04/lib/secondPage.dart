import 'package:demo04/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: Center(
        child: Text(
            '${context.watch<Counter>().count}'), //Text('${Provider.of<Counter>(context).count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Provider.of<Counter>(context).increment();
          context.read<Counter>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
