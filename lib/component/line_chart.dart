import 'package:dashboad/source/src.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluent_ui/fluent_ui.dart';

class LineChartComponent extends StatefulWidget {
  const LineChartComponent({Key? key}) : super(key: key);

  @override
  State<LineChartComponent> createState() => _LineChartComponentState();
}

class _LineChartComponentState extends State<LineChartComponent> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      lineChartData,
      swapAnimationDuration: const Duration(seconds: 2),
    );
  }

  LineChartData get lineChartData => LineChartData(
        minX: 0.0,
        maxX: 8,
        minY: 0.0,
        maxY: 3500,
        lineTouchData: lineTochData,
        gridData: FlGridData(show: false),
        borderData: borderData,
        titlesData: titlesData,
        lineBarsData: lineBarData,
      );

  List<LineChartBarData> get lineBarData =>
      [lineChart1, lineChart2, lineChart3];

  LineTouchData get lineTochData => LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData:
          LineTouchTooltipData(tooltipBgColor: Colors.transparent));

  FlBorderData get borderData => FlBorderData(
      show: true,
      border: Border(
          top: BorderSide.none,
          left: BorderSide(color: Colors.blue, width: 2),
          right: BorderSide.none,
          bottom: BorderSide(color: Colors.blue, width: 2)));

  FlTitlesData get titlesData => FlTitlesData(
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 50,
                interval: 500,
                getTitlesWidget: leftTitles)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 35,
                interval: 1,
                getTitlesWidget: bottomTitles)),
      );

  Widget leftTitles(double value, TitleMeta meta) => SideTitleWidget(
      space: 10, axisSide: meta.axisSide, child: Text(fm.format(value)));

  Widget bottomTitles(double value, TitleMeta meta) => SideTitleWidget(
      space: 1, axisSide: meta.axisSide, child: Text(fm.format(value)));

  LineChartBarData get lineChart1 => LineChartBarData(
          isCurved: true,
          color: Colors.blue,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
          spots: const [
            FlSpot(0, 200),
            FlSpot(1, 1000),
            FlSpot(2, 1200),
            FlSpot(3, 800),
            FlSpot(4, 400),
            FlSpot(5, 2000),
            FlSpot(6, 1500),
            FlSpot(7, 1200),
          ]);

  LineChartBarData get lineChart2 => LineChartBarData(
          isCurved: true,
          color: Colors.green,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
          spots: const [
            FlSpot(0, 1500),
            FlSpot(1, 400),
            FlSpot(2, 2500),
            FlSpot(3, 1800),
            FlSpot(4, 900),
            FlSpot(5, 1000),
            FlSpot(6, 400),
            FlSpot(7, 1100),
          ]);

  LineChartBarData get lineChart3 => LineChartBarData(
          isCurved: true,
          color: Colors.orange,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
          spots: const [
            FlSpot(0, 1200),
            FlSpot(1, 200),
            FlSpot(2, 800),
            FlSpot(3, 2100),
            FlSpot(4, 900),
            FlSpot(5, 1300),
            FlSpot(6, 600),
            FlSpot(7, 1000),
          ]);
}
