
import 'package:dashboad/component/card.dart';
import 'package:dashboad/component/dot.dart';
import 'package:dashboad/component/line_chart.dart';
import 'package:dashboad/source/src.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;

class DashboadScreen extends StatefulWidget {
  const DashboadScreen({super.key});

  @override
  State<DashboadScreen> createState() => _DashboadScreenState();
}

class _DashboadScreenState extends State<DashboadScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return isWinLinuxMac && constraints.maxWidth > 700
          ? Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child:
                            buildPieChart1(screenSize: constraints.maxWidth)),
                    Expanded(
                        child:
                            buildPieChart2(screenSize: constraints.maxWidth)),
                  ],
                ),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: pieLineChart(screenSize: constraints.maxWidth),
                    ),
                    buildTables(screenSize: constraints.maxWidth)
                  ],
                ))
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  buildPieChart1(screenSize: constraints.maxWidth),
                  buildPieChart2(screenSize: constraints.maxWidth),
                  pieLineChart(screenSize: constraints.maxWidth),
                  buildTables(screenSize: constraints.maxWidth)
                ],
              ),
            );
    });
  }

  Widget buildPieChart1({required double screenSize}) {
    return MyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Sale',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: 400,
                  minHeight: 200,
                  maxWidth:
                      isWinLinuxMac && screenSize > 700 ? 500 : screenSize,
                  minWidth: 150),
              child: Row(
                children: [
                  Flexible(child: pieChart1(screenSize: screenSize)),
                  const SizedBox(width: 20),
                  Flexible(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Dot.buildInfor(
                          leading: Dot.buildDot(color: Colors.green),
                          title: Text("Sale: ${fm.format(1000)} ₭")),
                      Dot.buildInfor(
                          leading: Dot.buildDot(color: Colors.magenta),
                          title: Text("Sale: ${fm.format(2000)} ₭")),
                      Dot.buildInfor(
                          leading: Dot.buildDot(color: Colors.red),
                          title: Text("Sale: ${fm.format(1300)} ₭")),
                      Dot.buildInfor(
                          leading: Dot.buildDot(color: Colors.orange),
                          title: Text("Sale: ${fm.format(1500)} ₭"))
                    ],
                  ))
                ],
              )),
        ],
      ),
    );
  }

  Widget buildPieChart2({required double screenSize}) {
    return MyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Payment',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: 400,
                  minHeight: 200,
                  maxWidth:
                      isWinLinuxMac && screenSize > 700 ? 500 : screenSize,
                  minWidth: 150),
              child: Row(
                children: [
                  Flexible(child: pieChart2(screenSize: screenSize)),
                  const SizedBox(width: 20),
                  Flexible(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Dot.buildInfor(
                          leading: Dot.buildDot(color: Colors.green),
                          title: Text("Sale: ${fm.format(1000)} ₭")),
                      Dot.buildInfor(
                          leading: Dot.buildDot(color: Colors.purple),
                          title: Text("Sale: ${fm.format(1000)} ₭")),
                      Dot.buildInfor(
                          leading: Dot.buildDot(color: Colors.orange),
                          title: Text("Sale: ${fm.format(1000)} ₭"))
                    ],
                  ))
                ],
              )),
        ],
      ),
    );
  }

  Widget buildTables({required double screenSize}) {
    return MyCard(
        child: SingleChildScrollView(
      child: SizedBox(
        width: isWinLinuxMac && screenSize > 700
            ? 300
            : MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.55,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            material.DataTable(columns: kColumns, rows: kRows),
          ],
        ),
      ),
    ));
  }

  Widget pieChart1({required double screenSize}) {
    return SizedBox(
      height: 200,
      width: isWinLinuxMac && screenSize > 700 ? double.infinity : screenSize,
      child: PieChart(
          PieChartData(sectionsSpace: 0, centerSpaceRadius: 32, sections: [
        PieChartSectionData(
            color: Colors.green,
            value: 1000,
            radius: 40,
            showTitle: true,
            titlePositionPercentageOffset: 1,
            title: '${fm.format(1000)} ₭'),
        PieChartSectionData(
            color: Colors.magenta,
            value: 2000,
            radius: 40,
            showTitle: true,
            titlePositionPercentageOffset: 1,
            title: '${fm.format(2000)} ₭'),
        PieChartSectionData(
            color: Colors.red,
            value: 1300,
            radius: 40,
            showTitle: true,
            titlePositionPercentageOffset: 1,
            title: '${fm.format(1300)} ₭'),
        PieChartSectionData(
            color: Colors.orange,
            value: 1500,
            radius: 40,
            showTitle: true,
            titlePositionPercentageOffset: 1,
            title: '${fm.format(1500)} ₭'),
      ])),
    );
  }

  Widget pieChart2({required double screenSize}) {
    return SizedBox(
      height: 200,
      width: isWinLinuxMac && screenSize > 700 ? double.infinity : screenSize,
      child: PieChart(
          PieChartData(sectionsSpace: 0, centerSpaceRadius: 32, sections: [
        PieChartSectionData(
            color: Colors.green,
            value: 2000,
            radius: 40,
            showTitle: true,
            titlePositionPercentageOffset: 1,
            title: '${fm.format(2000)} ₭'),
        PieChartSectionData(
            color: Colors.orange,
            value: 1300,
            radius: 40,
            showTitle: true,
            titlePositionPercentageOffset: 1,
            title: '${fm.format(1300)} ₭'),
        PieChartSectionData(
            color: Colors.purple,
            value: 1500,
            radius: 40,
            showTitle: true,
            titlePositionPercentageOffset: 1,
            title: '${fm.format(1500)} ₭'),
      ])),
    );
  }

  Widget pieLineChart({required double screenSize}) {
    return MyCard(
      child: SizedBox(
        width: isWinLinuxMac && screenSize > 700
            ? MediaQuery.of(context).size.width
            : screenSize,
        height: isWinLinuxMac && screenSize > 700 ? double.infinity : 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Sale and payment history of 7 days',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                  child: Dot.buildInfor(
                      leading: Dot.buildDot(color: Colors.blue),
                      title: const Text('Sale'))),
              const SizedBox(width: 30),
              Flexible(
                  child: Dot.buildInfor(
                      leading: Dot.buildDot(color: Colors.green),
                      title: const Text('Payment'))),
              const SizedBox(width: 30),
              Flexible(
                  child: Dot.buildInfor(
                      leading: Dot.buildDot(color: Colors.orange),
                      title: const Text('Sale')))
            ]),
            const SizedBox(height: 30),
            const Expanded(
              child: LineChartComponent(),
            )
          ],
        ),
      ),
    );
  }

  List<material.DataColumn> kColumns = const [
    material.DataColumn(
      label: Text(
        'No.',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    material.DataColumn(
      label: Text(
        'Date',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    material.DataColumn(
      label: Text(
        'Total',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    )
  ];

  List<material.DataRow> kRows = [
    material.DataRow(cells: <material.DataCell>[
      const material.DataCell(Text('1')),
      const material.DataCell(Text('Sun')),
      material.DataCell(Text('${fm.format(2500)} ₭'))
    ]),
    material.DataRow(cells: <material.DataCell>[
      const material.DataCell(Text('2')),
      const material.DataCell(Text('Mon')),
      material.DataCell(Text('${fm.format(3000)} ₭'))
    ]),
    material.DataRow(cells: <material.DataCell>[
      const material.DataCell(Text('3')),
      const material.DataCell(Text('Tue')),
      material.DataCell(Text('${fm.format(1500)} ₭'))
    ]),
    material.DataRow(cells: <material.DataCell>[
      const material.DataCell(Text('4')),
      const material.DataCell(Text('Wed')),
      material.DataCell(Text('${fm.format(1200)} ₭'))
    ]),
    material.DataRow(cells: <material.DataCell>[
      const material.DataCell(Text('5')),
      const material.DataCell(Text('Thu')),
      material.DataCell(Text('${fm.format(2000)} ₭'))
    ]),
    material.DataRow(cells: <material.DataCell>[
      const material.DataCell(Text('6')),
      const material.DataCell(Text('Fri')),
      material.DataCell(Text('${fm.format(900)} ₭'))
    ]),
    material.DataRow(cells: <material.DataCell>[
      const material.DataCell(Text('7')),
      const material.DataCell(Text('Sat')),
      material.DataCell(Text('${fm.format(1500)} ₭'))
    ]),
  ];
}
