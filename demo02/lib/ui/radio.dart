import 'package:flutter/material.dart';

class RadioValue extends StatelessWidget {
  const RadioValue({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _radioGroupValue = "语文";
    return Container(
      child: Column(
        children: [
          Radio(
            activeColor: Colors.red,
            value: "语文",
            groupValue: _radioGroupValue,
            onChanged: (value) {
              _radioGroupValue = value;
            },
          ),
          Radio(
            activeColor: Colors.red,
            value: "数学",
            groupValue: _radioGroupValue,
            onChanged: (value) {
              _radioGroupValue = value;
            },
          ),
          Radio(
            value: "英语",
            groupValue: _radioGroupValue,
            onChanged: (value) {
              _radioGroupValue = value;
            },
          ),
          Row(
            children: [
              Flexible(
                child: RadioListTile(
                    title: Text("语文"),
                    value: "语文",
                    groupValue: _radioGroupValue,
                    onChanged: (value) {}),
              ),
              Flexible(
                child: RadioListTile(
                    title: Text("数学"),
                    value: "数学",
                    groupValue: _radioGroupValue,
                    onChanged: (value) {}),
              ),
              Flexible(
                child: RadioListTile(
                    title: Text("英语"),
                    value: "英语",
                    groupValue: _radioGroupValue,
                    onChanged: (value) {}),
              ),
              Flexible(
                child: RadioListTile(
                    title: Text("物理"),
                    value: "物理",
                    groupValue: _radioGroupValue,
                    onChanged: (value) {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
