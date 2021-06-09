import 'package:demo06/contacts/contact_header.dart';
import 'package:demo06/contacts/contact_item.dart';
import 'package:demo06/contacts/contact_sider_list.dart';
import 'package:demo06/contacts/contact_vo.dart';
import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactSiderList(
        items: contactData,
        //好友列表头构造器
        headerBuilder: (context, index) {
          return Container(
            child: ContactHeader(),
          );
        },
        //好友列表项构造器
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: ContactItem(
              item: contactData[index],
            ),
          );
        },
        sectionBuilder: (context, index) {
          return Container(
            height: 32,
            color: Colors.grey[300],
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 14),
            child: Text(
              contactData[index].seationKey,
              style: TextStyle(fontSize: 14, color: Color(0xff909090)),
            ),
          );
        },
      ),
    );
  }
}
