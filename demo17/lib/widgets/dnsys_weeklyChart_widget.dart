import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DnsysWeeklyWidget extends StatelessWidget {
  const DnsysWeeklyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildEmptyPointChart();
  }

  SfCartesianChart _buildEmptyPointChart() {
    return SfCartesianChart(
      backgroundColor: Colors.grey.withOpacity(.5),
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Population growth of various countries',
          textStyle: const TextStyle(color: Colors.green)),
      primaryXAxis: CategoryAxis(
        labelStyle: const TextStyle(color: Colors.green),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          labelStyle: const TextStyle(color: Colors.green),
          //title: AxisTitle(textStyle: TextStyle(color: Colors.red)),
          axisLine: const AxisLine(width: 0),
          labelFormat: '{value}%',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getEmptyPointSeries(),
      // tooltipBehavior: _tooltipBehavior,
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getEmptyPointSeries() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: getWeek(0), y: 1.541),
          ChartSampleData(x: getWeek(1), y: 0.541),
          ChartSampleData(x: getWeek(2), y: 0.2),
          ChartSampleData(x: getWeek(3), y: 1.51),
          ChartSampleData(x: getWeek(4), y: 1.302),
          ChartSampleData(x: getWeek(5), y: 0.5),
          ChartSampleData(x: getWeek(6), y: 1.683),
        ],

        /// To enable the empty point mode, set the specific mode.
        emptyPointSettings: EmptyPointSettings(
            mode: EmptyPointMode
                .gap), //EmptyPointMode.zero EmptyPointMode.average EmptyPointMode.drop
        color: Colors.green,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            textStyle: TextStyle(fontSize: 10, color: Colors.green)),
      )
    ];
  }
}

String getWeek(double value) {
  switch (value.toInt()) {
    case 0:
      return 'MON';
    case 1:
      return 'TUE';
    case 2:
      return 'WED';
    case 3:
      return 'THU';
    case 4:
      return 'FRI';
    case 5:
      return 'SAT';
    case 6:
      return 'SUN';
    default:
      return '';
  }
}

class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
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
