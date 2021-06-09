enum MessageType { SYSTEM, PUBLIC, CHAT, GROUP }

class MessageData {
  String avatar;
  String title;
  String subTitle;
  DateTime time;
  MessageType type;
  MessageData(
    this.avatar,
    this.title,
    this.subTitle,
    this.time,
    this.type,
  );
}

List<MessageData> messageData = [
  MessageData(
      'https://raw.githubusercontent.com/sxm5220/demoByFlutter/master/demo05/asset/images/1.jpg',
      '一休哥',
      '突然想到的',
      DateTime.now(),
      MessageType.CHAT),
  MessageData(
      'https://github.com/sxm5220/demoByFlutter/blob/master/demo03/assets/images/logo.png?raw=true',
      '哆啦A梦',
      '机器猫！！！',
      DateTime.now(),
      MessageType.CHAT),
  MessageData(
      'https://raw.githubusercontent.com/sxm5220/demoByFlutter/master/demo05/asset/images/1.jpg',
      '一休哥',
      '我在思考问题。。',
      DateTime.now(),
      MessageType.CHAT),
  MessageData(
      'https://github.com/sxm5220/demoByFlutter/blob/master/demo03/assets/images/logo.png?raw=true',
      '忍者神龟',
      '忍者神龟。。。。',
      DateTime.now(),
      MessageType.CHAT),
  MessageData(
      'https://raw.githubusercontent.com/sxm5220/demoByFlutter/master/demo05/asset/images/1.jpg',
      '光头强',
      '我是光头强。。',
      DateTime.now(),
      MessageType.CHAT),
  MessageData(
      'https://github.com/sxm5220/demoByFlutter/blob/master/demo03/assets/images/logo.png?raw=true',
      '熊二',
      '俺是熊二。。',
      DateTime.now(),
      MessageType.CHAT),
  MessageData(
      'https://raw.githubusercontent.com/sxm5220/demoByFlutter/master/demo05/asset/images/1.jpg',
      '超级飞侠',
      '超级飞侠。。',
      DateTime.now(),
      MessageType.CHAT),
  MessageData(
      'https://github.com/sxm5220/demoByFlutter/blob/master/demo03/assets/images/logo.png?raw=true',
      '大耳朵图图',
      '突然想到的',
      DateTime.now(),
      MessageType.CHAT),
  MessageData(
      'https://raw.githubusercontent.com/sxm5220/demoByFlutter/master/demo05/asset/images/1.jpg',
      '哆啦A梦',
      '机器猫！！！',
      DateTime.now(),
      MessageType.CHAT),
  MessageData(
      'https://github.com/sxm5220/demoByFlutter/blob/master/demo03/assets/images/logo.png?raw=true',
      '一休哥',
      '我在思考问题。。',
      DateTime.now(),
      MessageType.CHAT),
];
