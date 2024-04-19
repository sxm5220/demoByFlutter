import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

///髋活动度
class DnsysPelvicRangeWidget extends StatefulWidget {
  const DnsysPelvicRangeWidget({
    super.key,
    required this.title,
    required this.chartColor,
    required this.max,
    required this.servoHipPos,
  });
  final String title;
  final Color chartColor;
  final int max;
  final dynamic servoHipPos;

  @override
  State<DnsysPelvicRangeWidget> createState() => _DnsysPelvicRangeWidgetState();
}

class _DnsysPelvicRangeWidgetState extends State<DnsysPelvicRangeWidget> {
  //点击单个Chart显示详情信息
  // TooltipBehavior? _tooltipBehavior;
  //创建数据流
  var _streamController = StreamController();
  //创建监听及监听管理对象
  StreamSubscription? _subscription;

  Timer? _timer;
  ChartSeriesController? chartHiloSeriesController;
  List<DnsysChartSampleData> chartData = [];

  DnsysPoint currentPoint = DnsysPoint(x: 0, y: 0);
  DnsysSegment currentSegment = DnsysSegment(
      forePoint: DnsysPoint(x: 0, y: 0), behindPoint: DnsysPoint(x: 0, y: 0));
  List dataBuffer = [];
  // List segmentList = [];
  double minDiff = 0.1;

  void _startTimer() {
    //计时开始
    _timer = Timer.periodic(const Duration(milliseconds: 1000), _update);
  }

  ///停止计时
  void _stopTimer() {
    _timer?.cancel();
  }

  int randomWithMinBetweenMax(int min, int max) {
    final math.Random random = math.Random();
    int val = max - min;
    return min + random.nextInt(val);
  }

  _update(Timer timer) {
    double randoNum = randomWithMinBetweenMax(-4, 4) * 0.12345; //
    // debugPrint('randoNum:$randoNum');
    dataBuffer.add(randoNum);
    if (dataBuffer.length == 1) {
      currentPoint = DnsysPoint(x: 0, y: randoNum);
      currentSegment =
          DnsysSegment(forePoint: currentPoint, behindPoint: currentPoint);
    } else if (dataBuffer.length == 2) {
      currentPoint = DnsysPoint(x: 1, y: randoNum);
      currentSegment = DnsysSegment(
          forePoint: currentSegment.forePoint, behindPoint: currentPoint);
    }
    if (currentSegment.isRising()) {
      if (randoNum >= currentSegment.behindPoint.y) {
        currentPoint = DnsysPoint(x: currentPoint.x + 1, y: randoNum);
        currentSegment = DnsysSegment(
            forePoint: currentSegment.forePoint, behindPoint: currentPoint);
      } else if (randoNum < currentSegment.behindPoint.y - minDiff) {
        currentPoint = DnsysPoint(x: currentPoint.x + 1, y: randoNum);
        // segmentList.add(currentSegment);
        _streamController.sink.add(currentSegment);
        currentSegment = DnsysSegment(
            forePoint: currentSegment.behindPoint, behindPoint: currentPoint);
      } else {
        currentPoint = DnsysPoint(x: currentPoint.x + 1, y: randoNum);
      }
    } else if (currentSegment.isFalling()) {
      if (randoNum <= currentSegment.behindPoint.y) {
        currentPoint = DnsysPoint(x: currentPoint.x + 1, y: randoNum);
        currentSegment = DnsysSegment(
            forePoint: currentSegment.forePoint, behindPoint: currentPoint);
      } else if (randoNum > currentSegment.behindPoint.y + minDiff) {
        currentPoint = DnsysPoint(x: currentPoint.x + 1, y: randoNum);
        // segmentList.add(currentSegment);
        _streamController.sink.add(currentSegment);
        currentSegment = DnsysSegment(
            forePoint: currentSegment.behindPoint, behindPoint: currentPoint);
      } else {
        currentPoint = DnsysPoint(x: currentPoint.x + 1, y: randoNum);
      }
    } else {
      currentPoint = DnsysPoint(x: currentPoint.x + 1, y: randoNum);
      currentSegment = DnsysSegment(
          forePoint: currentSegment.forePoint, behindPoint: currentPoint);
    }
    // debugPrint('x:${currentSegment.behindPoint.x}');
    // debugPrint(
    //     'startX:${currentSegment.forePoint.x} y:${currentSegment.forePoint.y} endX:${currentSegment.behindPoint.x} y:${currentSegment.behindPoint.y}');
    // for (var seg in segmentList) {
    //   debugPrint(
    //       '7:${seg.forePoint.x} y:${seg.forePoint.y} == ${seg.behindPoint.x} y:${seg.behindPoint.y}');
    // }
  }

  //横向x坐标
  double pointX = 0;
  //共显示个数
  int totalCount = 25;

  @override
  void initState() {
    super.initState();
    _subscription = _streamController.stream.listen((currentSegment) {
      pointX += 1.0;
      chartData.add(DnsysChartSampleData(
          x: pointX,
          high: currentSegment.forePoint.y * 10,
          low: currentSegment.behindPoint.y * 10,
          pointColor: widget.chartColor));
      chartData.removeAt(0);
      chartHiloSeriesController?.updateDataSource(
        addedDataIndexes: <int>[chartData.length - 1],
        removedDataIndexes: <int>[0],
      );
    });
    //默认填充totalCount个(填满，为了新数据可以自然的向左移动)
    for (int i = 0; i < totalCount; i++) {
      pointX += 1.0;
      chartData.add(
        DnsysChartSampleData(
            x: pointX, high: 0, low: 0, pointColor: Colors.transparent),
      );
      chartHiloSeriesController?.updateDataSource(
        addedDataIndexes: <int>[chartData.length - 1],
        removedDataIndexes: <int>[0],
      );
    }
    // _startTimer();
    // _tooltipBehavior = TooltipBehavior(enable: true);
    // _updateTest();
  }

  /*_updateTest() {
    List randoNums = [-1, -2, 2, 1, 3, 0, -3, -2, -1, 3, -1, -2];
    // double randoNum = randomWithMinBetweenMax(-4, 4).toDouble();
    for (var randoNum in randoNums) {
      dataBuffer.add(randoNum);
      if (dataBuffer.length == 1) {
        currentPoint = DnsysPoint(x: 0, y: randoNum);
        currentSegment =
            DnsysSegment(forePoint: currentPoint, behindPoint: currentPoint);
        debugPrint(
            '1:${currentSegment.forePoint.x} y:${currentSegment.forePoint.y} == ${currentSegment.behindPoint.x} y:${currentSegment.behindPoint.y}');
      } else if (dataBuffer.length == 2) {
        currentPoint = DnsysPoint(x: 1, y: randoNum);
        currentSegment = DnsysSegment(
            forePoint: currentSegment.forePoint, behindPoint: currentPoint);
        debugPrint(
            '2:${currentSegment.forePoint.x} y:${currentSegment.forePoint.y} == ${currentSegment.behindPoint.x} y:${currentSegment.behindPoint.y}');
      }
      currentPoint = DnsysPoint(x: currentPoint.x + 1, y: randoNum);
      if (currentSegment.isRising()) {
        if (randoNum >= currentSegment.behindPoint.y) {
          currentSegment = DnsysSegment(
              forePoint: currentSegment.forePoint, behindPoint: currentPoint);
          debugPrint(
              '3:${currentSegment.forePoint.x} y:${currentSegment.forePoint.y} == ${currentSegment.behindPoint.x} y:${currentSegment.behindPoint.y}');
        } else if (randoNum < currentSegment.behindPoint.y - 1) {
          segmentList.add(currentSegment);
          currentSegment = DnsysSegment(
              forePoint: currentSegment.behindPoint, behindPoint: currentPoint);
          debugPrint(
              '4:${currentSegment.forePoint.x} y:${currentSegment.forePoint.y} == ${currentSegment.behindPoint.x} y:${currentSegment.behindPoint.y}');
        }
      } else if (currentSegment.isFalling()) {
        if (randoNum <= currentSegment.behindPoint.y) {
          currentSegment = DnsysSegment(
              forePoint: currentSegment.forePoint, behindPoint: currentPoint);
          debugPrint(
              '5:${currentSegment.forePoint.x} y:${currentSegment.forePoint.y} == ${currentSegment.behindPoint.x} y:${currentSegment.behindPoint.y}');
        } else if (randoNum > currentSegment.behindPoint.y + 1) {
          segmentList.add(currentSegment);
          currentSegment = DnsysSegment(
              forePoint: currentSegment.behindPoint, behindPoint: currentPoint);
          debugPrint(
              '6:${currentSegment.forePoint.x} y:${currentSegment.forePoint.y} == ${currentSegment.behindPoint.x} y:${currentSegment.behindPoint.y}');
        }
      } else {
        currentSegment = DnsysSegment(
            forePoint: currentSegment.forePoint, behindPoint: currentPoint);
        debugPrint(
            '7:${currentSegment.forePoint.x} y:${currentSegment.forePoint.y} == ${currentSegment.behindPoint.x} y:${currentSegment.behindPoint.y}');
      }
    }
    debugPrint("segmentList:$segmentList");

    // debugPrint('x:${currentSegment.behindPoint.x}');
    /* chartData.add(DnsysChartSampleData(
      x: currentSegment.behindPoint.x,
      high: currentSegment.forePoint.y,
      low: currentSegment.behindPoint.y,
    ));
    if (chartData.length == 25) {
      chartData.removeAt(0);
      chartHiloSeriesController?.updateDataSource(
        addedDataIndexes: <int>[chartData.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      chartHiloSeriesController?.updateDataSource(
        addedDataIndexes: <int>[chartData.length - 1],
      );
    }
    setState(() {
      chartData;
    });*/

    /*debugPrint(
        'startX:${currentSegment.forePoint.x} y:${currentSegment.forePoint.y} endX:${currentSegment.behindPoint.x} y:${currentSegment.behindPoint.y}');
    for (var seg in segmentList) {
      debugPrint(
          '7:${seg.forePoint.x} y:${seg.forePoint.y} == ${seg.behindPoint.x} y:${seg.behindPoint.y}');
    }*/
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title),
            const SizedBox(height: 10),
            Container(
              height: 100.w * 2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(.5),
                  width: .5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: _pelvicRangeChart(),
              ),
            ),
          ],
        ),
      ),
      Row(
        children: [
          IconButton(
              onPressed: () {
                _startTimer();
              },
              icon: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.green,
              )),
          IconButton(
              onPressed: () {
                _stopTimer();
              },
              icon: const Icon(
                Icons.stop,
                color: Colors.red,
              ))
        ],
      )
    ]);
  }

  SfCartesianChart _pelvicRangeChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      // title: ChartTitle(text: widget.title, alignment: ChartAlignment.near),
      primaryXAxis: NumericAxis(
        // minimum: 0,
        // maximum: currentSegment.forePoint.x,
        // labelFormat: '${currentSegment.forePoint.x}',
        //title: AxisTitle(text: 'Time', textStyle: TextStyle(color: Colors.red)),
        // visibleMinimum: 0,
        // visibleMaximum: 10,
        isVisible: true, //横坐标不显示
        interval: 1, //x 以‘1’做累加
        autoScrollingMode: AutoScrollingMode.start,
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          interval: widget.max / 2.0,
          minimum: widget.max.toDouble(),
          maximum: -widget.max.toDouble(),
          labelFormat: '{value}°', //r'${value}',
          axisLine: const AxisLine(width: 0)),
      series: _getHiloSeries(),
      // tooltipBehavior: _tooltipBehavior,
    );
  }

  List<HiloSeries<DnsysChartSampleData, double>> _getHiloSeries() {
    return <HiloSeries<DnsysChartSampleData, double>>[
      HiloSeries<DnsysChartSampleData, double>(
        onRendererCreated: (ChartSeriesController controller) {
          chartHiloSeriesController = controller;
        },
        dataSource: chartData, //widget.listData,
        borderWidth: 5,
        xValueMapper: (DnsysChartSampleData sales, _) => sales.x,
        lowValueMapper: (DnsysChartSampleData sales, _) => sales.low,
        highValueMapper: (DnsysChartSampleData sales, _) => sales.high,
        pointColorMapper: (DnsysChartSampleData sales, _) => sales.pointColor,
        // color: widget.chartColor,
        // name: '详情',
        // markerSettings: const MarkerSettings(isVisible: false), //两头显示圆圈
        // showIndicationForSameValues: false,
      )
    ];
  }

  @override
  void dispose() {
    _stopTimer();
    chartData.clear();
    chartHiloSeriesController = null;
    _subscription?.cancel();
    _streamController.close();
    super.dispose();
  }
}

class DnsysChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  DnsysChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}

class DnsysPoint {
  final double x;
  final double y;
  DnsysPoint({required this.x, required this.y});
}

class DnsysSegment {
  //前面
  final DnsysPoint forePoint;
  //后面
  final DnsysPoint behindPoint;
  DnsysSegment({required this.forePoint, required this.behindPoint});

  double length() {
    return behindPoint.x - forePoint.x;
  }

  double diff() {
    return behindPoint.y - forePoint.y;
  }

  bool isRising() {
    return diff() > 0;
  }

  bool isFalling() {
    return diff() < 0;
  }
}
