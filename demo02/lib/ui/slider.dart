import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  SliderDemo({Key key}) : super(key: key);

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("值$_sliderValue"),
          Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
              min: 0,
              max: 100,
              divisions: 100,
              label: "$_sliderValue",
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              }),
          SliderTheme(
              data: SliderTheme.of(context).copyWith(
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              ),
              child: Slider(
                value: _sliderValue,
                label: "$_sliderValue",
                min: 0,
                max: 100,
                divisions: 100,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ))
        ],
      ),
    );
  }
}
