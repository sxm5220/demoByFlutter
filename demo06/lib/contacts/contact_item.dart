import 'package:demo06/common/values/values.dart';
import 'package:demo06/contacts/contact_vo.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final ContactVO item;
  final String? titleName;
  final String? imageName;
  const ContactItem(
      {Key? key, required this.item, this.titleName, this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 52.0,
      child: FlatButton(
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageName == null
                ? Image.network(
                    item.avatarUrl != ''
                        ? item.avatarUrl
                        : 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544070910437&di=86ffd13f433c252d4c49afe822e87462&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%3D580%2Fsign%3Debf3e26b1a4c510faec4e21250582528%2F0cf431adcbef76092781a53c2edda3cc7dd99e8e.jpg',
                    width: 36,
                    height: 36,
                    scale: 0.9,
                  )
                : assetWithImage(imageName!, 36, 36),
            Container(
              margin: EdgeInsets.only(left: 12.0),
              child: Text(
                titleName == null ? item.name : titleName!,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF353535),
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
