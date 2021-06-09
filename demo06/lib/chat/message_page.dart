import 'package:demo06/chat/message_data.dart';
import 'package:demo06/chat/message_item.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MessageItem(
            message: messageData[index],
          );
        },
        itemCount: messageData.length,
      ),
    );
  }
}
