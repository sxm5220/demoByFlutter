import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  SwitchDemo({Key key}) : super(key: key);

  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  var _switchValue = false;

  Widget _buildSwitch() {
    return SwitchListTile(
      title: Text("是否允许4G下载"),
      value: _switchValue,
      onChanged: (value) {
        setState(() {
          _switchValue = value;
        });
      },
    );
  }

  Widget _buildiOSWithSwitch() {
    return CupertinoSwitch(
      value: _switchValue,
      onChanged: (value) {
        setState(() {
          _switchValue = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Switch(
              inactiveThumbColor: Colors.black54,
              activeThumbImage: AssetImage('assets/images/logo.png'),
              activeColor: Colors.white,
              activeTrackColor: Colors.blue,
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              })
          // _buildSwitch()
          // _buildiOSWithSwitch()
        ],
      ),
    );
  }
}
