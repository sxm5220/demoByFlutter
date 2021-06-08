import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items =
        List<String>.generate(30, (index) => '列表项 ${index + 1}');
    return Scaffold(
      appBar: AppBar(
        title: Text('滑动删除示例'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          child: ListTile(
            title: Text('$item'),
          ),
          key: Key(item),
          onDismissed: (direction) {
            items.removeAt(index);
            print('$item被删除了');
          },
        );
      }),
    );
  }
}
