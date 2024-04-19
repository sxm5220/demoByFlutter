import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'dnsys_pelvicRange_widget.dart';

class _ChartData {
  _ChartData(this.x, this.y, this.color);
  final double x;
  final double y;
  final Color color;
}

class DnsysSpeedWidget extends StatefulWidget {
  const DnsysSpeedWidget(
      {super.key,
      this.servoHipPos,
      required this.title,
      required this.chartColor,
      required this.max});
  final dynamic servoHipPos;
  final String title;
  final Color chartColor;
  final int max;

  @override
  State<DnsysSpeedWidget> createState() => _DnsysSpeedWidgetState();
}

class _DnsysSpeedWidgetState extends State<DnsysSpeedWidget> {
  //点击单个Chart显示详情信息
  // TooltipBehavior? _tooltipBehavior;
  ChartSeriesController? chartSeriesController;
  List<DnsysChartSampleData> chartData = [];

  DnsysPoint currentPoint = DnsysPoint(x: 0, y: 0);
  DnsysSegment currentSegment = DnsysSegment(
      forePoint: DnsysPoint(x: 0, y: 0), behindPoint: DnsysPoint(x: 0, y: 0));

  //横向x坐标
  double pointX = 0;
  //共显示个数
  int totalCount = 25;

  Timer? _timer;

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
    double randoNum = randomWithMinBetweenMax(1, widget.max) * 1.0;
    // debugPrint('randoNum:$randoNum');
    setState(() {
      speed = randoNum;
    });
  }

  int maximum = 0;
  double speed = 0;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < totalCount; i++) {
      pointX += 1.0;
      chartData.add(
        DnsysChartSampleData(x: pointX, y: 0, pointColor: widget.chartColor),
      );
      chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[chartData.length - 1],
        removedDataIndexes: <int>[0],
      );
    }
    // _startStrideFrequencyTimer();
    maximum = widget.max.toInt() + 1;
    // _startTimer();
  }

  double height = 100.w * 2.5;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 100), () {
      pointX += 1.0;
      chartData.add(
        DnsysChartSampleData(
          x: pointX,
          y: speed, // speed:1.0-10.0 widget.max:10.0
          pointColor: widget.chartColor,
        ),
      );
      chartData.removeAt(0);
      chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[chartData.length - 1],
        removedDataIndexes: <int>[0],
      );
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(.5),
                width: .5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: _buildDefaultLineChart(),
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
        ],
      ),
    );

    Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(.5),
          width: .5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      child:
          _buildDefaultLineChart(), /*Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            height: height * .5,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Color.fromRGBO(255, 78, 78, .5),
                    Color.fromRGBO(255, 78, 78, .4),
                    Color.fromRGBO(255, 78, 78, .2),
                    Color.fromRGBO(255, 78, 78, .1),
                    Color.fromRGBO(255, 78, 78, .08),
                  ]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
            ),
            child: Column(
              children: [
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DnsysTextWidget(
                        text: SyMultiLanguage.multiLanguage()
                            .sy_goal_title('1m/s'),
                        color: Colors.red,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const DnsysSeparatorLineWidget(
                      color: Colors.blue,
                    ),
                  ],
                )
              ],
            ),
          ),
          _buildDefaultLineChart(),
        ],
      ),*/
    );
  }

  //Axis animation
  /// Get the cartesian chart with default line series
  SfCartesianChart _buildDefaultLineChart() {
    //primaryYAxis y轴动态变化，保留最大值
    if (speed > maximum) {
      maximum = speed.toInt() + 1;
    }
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      // title: ChartTitle(text: widget.title, alignment: ChartAlignment.near),
      primaryXAxis: NumericAxis(
        isVisible: false, //横坐标不显示
        interval: 1, //x 以‘1’做累加
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        isVisible: true,
        interval: maximum / 2.0,
        // maximum: max,
        visibleMaximum: maximum.toDouble(),
        minimum: 0, //速度不可能为负
        labelFormat: '{value}m/s', //r'${value}',
        axisLine: const AxisLine(width: 0),
      ),
      series: _getDefaultLineSeries(),
      /*legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 2,
          majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis:  NumericAxis(
          labelFormat: '{value}%',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(color: Colors.transparent))
      // tooltipBehavior: TooltipBehavior(enable: true),*/
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<DnsysChartSampleData, num>> _getDefaultLineSeries() {
    return <LineSeries<DnsysChartSampleData, num>>[
      LineSeries<DnsysChartSampleData, num>(
        onRendererCreated: (ChartSeriesController controller) {
          chartSeriesController = controller;
        },
        dataSource: chartData,
        width: 2,
        markerSettings: const MarkerSettings(
          height: 5,
          width: 5,
          isVisible: true,
          // color: Colors.white,
          // borderWidth: 3,
          // borderColor: widget.chartColor,
        ),
        xValueMapper: (DnsysChartSampleData sales, _) => sales.x,
        yValueMapper: (DnsysChartSampleData sales, _) => sales.y,
        pointColorMapper: (DnsysChartSampleData sales, _) => sales.pointColor,
        // color: widget.chartColor,
        // name: 'Germany',
        // animationDuration: 2500,
      ),
    ];
  }

  @override
  void dispose() {
    _stopTimer();
    chartData.clear();
    chartSeriesController = null;
    super.dispose();
  }
}

///分割线
class DnsysSeparatorLineWidget extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  const DnsysSeparatorLineWidget({
    Key? key,
    this.height = 1.0,
    this.color = Colors.grey,
    this.dashWidth = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
