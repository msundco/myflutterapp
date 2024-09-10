import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = Scaffold.of(context).appBarMaxHeight ?? kToolbarHeight;
    final availableHeight = screenHeight - appBarHeight;

    return Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Row(
                      children: [
                        Text('Measurement values'),
                        Icon(Icons.add),
                      ],
                    ),
                    onPressed: () => (),
                  ),
                  IconButton(
                    icon: Row(
                      children: [
                        Icon(Icons.circle),
                        Text(' P/U'),
                      ],
                    ),
                    onPressed: () => (),
                  ),
                  IconButton(
                    icon: Row(
                      children: [
                        Icon(Icons.circle),
                        Text(' I/U'),
                      ],
                    ),
                    onPressed: () => (),
                  ),
                  IconButton(
                    icon: Icon(Icons.square_outlined),
                    onPressed: () => (),
                  ),
                ],
              ),
            ),
            const Text('Plot'),
            Container(
              // color: Colors.grey,
              height: availableHeight / 1.5,
              child: SfCartesianChart(
                // Initialize category axis
                primaryXAxis: const CategoryAxis(
                  labelRotation: -45,
                ),
                primaryYAxis: const NumericAxis(
                  title: AxisTitle(text: 'Primary Axis'),
                  axisLine: AxisLine(color: Colors.green),
                  anchorRangeToVisiblePoints: false,
                  labelRotation: -45,
                ),
                axes: const <ChartAxis>[
                  NumericAxis(
                    name: 'secondaryYAxis',
                    opposedPosition: true,
                    axisLine: AxisLine(color: Colors.blue),
                    title: AxisTitle(
                      text: 'Secondary Axis',
                    ),
                    majorGridLines: MajorGridLines(
                      width: 0,
                    ),
                  ),
                ],
                series: <CartesianSeries>[
                  //Erste Achse
                  SplineSeries<SalesData, String>(
                      splineType: SplineType.cardinal,
                      // Bind data source
                      dataSource: <SalesData>[
                        SalesData('Jan', 35),
                        SalesData('Feb', 28),
                        SalesData('Mar', 34),
                        SalesData('Apr', 32),
                        SalesData('May', 40)
                      ],
                      color: Colors.green,
                      xValueMapper: (SalesData sales, _) => sales.month,
                      yValueMapper: (SalesData sales, _) => sales.sales),

                  //Zweite Achse
                  SplineSeries<SalesData, String>(
                      // Bind data source
                      dataSource: <SalesData>[
                        SalesData('Jan', 10),
                        SalesData('Feb', 100),
                        SalesData('Mar', 30),
                        SalesData('Apr', 20),
                        SalesData('May', 10)
                      ],
                      color: Colors.blue,
                      xValueMapper: (SalesData sales, _) => sales.month,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      yAxisName: 'secondaryYAxis')
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => (),
              child: Text('Start PV scan'),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.month, this.sales);
  final String month;
  final double sales;
}
