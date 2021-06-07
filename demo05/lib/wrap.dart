import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap按宽高自动布局示例'),
      ),
      body: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: [
          Chip(
            label: Text('A'),
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text(
                'A',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
          Chip(
            label: Text('B'),
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text(
                'B',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
          Chip(
            label: Text('C'),
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text(
                'C',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
