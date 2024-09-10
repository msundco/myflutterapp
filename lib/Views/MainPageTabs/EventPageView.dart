import 'package:flutter/material.dart';
import 'package:myflutterapp/Models/customWidgets/customControls.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

const List<Widget> timePeriod = <Widget>[
  Text('Tag'),
  Text('Monat'),
  Text('Jahr'),
  Text('Gesamt'),
];

class HomePageYield extends StatefulWidget {
  const HomePageYield({super.key});

  @override
  State<HomePageYield> createState() => _HomePageYieldState();
}

//Vielleicht mit DataTable machen https://www.youtube.com/watch?v=ktTajqbhIcY

class _HomePageYieldState extends State<HomePageYield> {
  final List<bool> _selectedTimePeriod = <bool>[true, false, false, false];
  DateTime? _Date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void selectDate() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
      ).then(
        (value) {
          setState(
            () {
              _Date = value;
            },
          );
        },
      );
    }

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            //Toggle Buttons
            ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  // The button that is tapped is set to true, and the others to false.
                  for (int i = 0; i < _selectedTimePeriod.length; i++) {
                    _selectedTimePeriod[i] = i == index;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.blue[700],
              selectedColor: Colors.black,
              fillColor: Colors.blue[200],
              color: Colors.blue[400],
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedTimePeriod,
              children: timePeriod,
            ),

            //DatePicker
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(_Date.toString()),
                  IconButton(
                    icon: Icon(Icons.calendar_month),
                    onPressed: selectDate,
                  ),
                ],
              ),
            ),

            //Measurment Values Button
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        Icon(Icons.square_outlined),
                      ],
                    ),
                    onPressed: () => (),
                  ),
                ],
              ),
            ),

            //Chart
            Container(
              // color: Colors.grey,
              height: 350,
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

//Export Button
            ElevatedButton(
              onPressed: () => (),
              child: Text('Export'),
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

// import 'package:flutter/material.dart';
// import 'package:myflutterapp/Models/customWidgets/customControls.dart';

// class EventPage extends StatefulWidget {
//   const EventPage({super.key});

//   @override
//   State<EventPage> createState() => _EventPageState();
// }

// //Vielleicht mit DataTable machen https://www.youtube.com/watch?v=ktTajqbhIcY

// class _EventPageState extends State<EventPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Column(
//       children: [
//         Expanded(child: Text('Row1')),
//         Expanded(child: Text('Row2')),
//         Expanded(child: Text('Row3'))
//       ],
//     ));
//   }
// }

// import 'package:fl_chart-main/fl_chart-main/example/lib/presentation/resources/app_resources.dart';
// import 'package:fl_chart-main/fl_chart-main/example/lib\util/extensions/color_extensions.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class LineChartSample6 extends StatelessWidget {
//   LineChartSample6({
//     super.key,
//     Color? line1Color1,
//     Color? line1Color2,
//     Color? line2Color1,
//     Color? line2Color2,
//   })  : line1Color1 = line1Color1 ?? AppColors.contentColorOrange,
//         line1Color2 = line1Color2 ?? AppColors.contentColorOrange.darken(60),
//         line2Color1 = line2Color1 ?? AppColors.contentColorBlue.darken(60),
//         line2Color2 = line2Color2 ?? AppColors.contentColorBlue {
//     minSpotX = spots.first.x;
//     maxSpotX = spots.first.x;
//     minSpotY = spots.first.y;
//     maxSpotY = spots.first.y;

//     for (final spot in spots) {
//       if (spot.x > maxSpotX) {
//         maxSpotX = spot.x;
//       }

//       if (spot.x < minSpotX) {
//         minSpotX = spot.x;
//       }

//       if (spot.y > maxSpotY) {
//         maxSpotY = spot.y;
//       }

//       if (spot.y < minSpotY) {
//         minSpotY = spot.y;
//       }
//     }
//   }

//   final Color line1Color1;
//   final Color line1Color2;
//   final Color line2Color1;
//   final Color line2Color2;

//   final spots = const [
//     FlSpot(0, 1),
//     FlSpot(2, 5),
//     FlSpot(4, 3),
//     FlSpot(6, 5),
//   ];

//   final spots2 = const [
//     FlSpot(0, 3),
//     FlSpot(2, 1),
//     FlSpot(4, 2),
//     FlSpot(6, 1),
//   ];

//   late double minSpotX;
//   late double maxSpotX;
//   late double minSpotY;
//   late double maxSpotY;

//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//     final style = TextStyle(
//       color: line1Color1,
//       fontWeight: FontWeight.bold,
//       fontSize: 18,
//     );

//     final intValue = reverseY(value, minSpotY, maxSpotY).toInt();

//     if (intValue == (maxSpotY + minSpotY)) {
//       return Text('', style: style);
//     }

//     return Padding(
//       padding: const EdgeInsets.only(right: 6),
//       child: Text(
//         intValue.toString(),
//         style: style,
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   Widget rightTitleWidgets(double value, TitleMeta meta) {
//     final style = TextStyle(
//       color: line2Color2,
//       fontWeight: FontWeight.bold,
//       fontSize: 18,
//     );
//     final intValue = reverseY(value, minSpotY, maxSpotY).toInt();

//     if (intValue == (maxSpotY + minSpotY)) {
//       return Text('', style: style);
//     }

//     return Text(intValue.toString(), style: style, textAlign: TextAlign.right);
//   }

//   Widget topTitleWidgets(double value, TitleMeta meta) {
//     if (value % 1 != 0) {
//       return Container();
//     }
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       color: AppColors.mainTextColor2,
//     );
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: Text(value.toInt().toString(), style: style),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 22, bottom: 20),
//       child: AspectRatio(
//         aspectRatio: 2,
//         child: LineChart(
//           LineChartData(
//             lineTouchData: LineTouchData(
//               touchTooltipData: LineTouchTooltipData(
//                 tooltipRoundedRadius: 0,
//                 getTooltipColor: (spot) => Colors.white,
//                 getTooltipItems: (List<LineBarSpot> touchedSpots) {
//                   return touchedSpots.map((LineBarSpot touchedSpot) {
//                     return LineTooltipItem(
//                       touchedSpot.y.toString(),
//                       TextStyle(
//                         color: touchedSpot.bar.gradient!.colors.first,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     );
//                   }).toList();
//                 },
//               ),
//               getTouchedSpotIndicator: (
//                 _,
//                 indicators,
//               ) {
//                 return indicators
//                     .map((int index) => const TouchedSpotIndicatorData(
//                           FlLine(color: Colors.transparent),
//                           FlDotData(show: false),
//                         ))
//                     .toList();
//               },
//               touchSpotThreshold: 12,
//               distanceCalculator:
//                   (Offset touchPoint, Offset spotPixelCoordinates) =>
//                       (touchPoint - spotPixelCoordinates).distance,
//             ),
//             lineBarsData: [
//               LineChartBarData(
//                 gradient: LinearGradient(
//                   colors: [
//                     line1Color1,
//                     line1Color2,
//                   ],
//                 ),
//                 spots: reverseSpots(spots, minSpotY, maxSpotY),
//                 isCurved: true,
//                 isStrokeCapRound: true,
//                 barWidth: 10,
//                 belowBarData: BarAreaData(
//                   show: false,
//                 ),
//                 dotData: FlDotData(
//                   show: true,
//                   getDotPainter: (spot, percent, barData, index) {
//                     return FlDotCirclePainter(
//                       radius: 12,
//                       color: Color.lerp(
//                         line1Color1,
//                         line1Color2,
//                         percent / 100,
//                       )!,
//                       strokeColor: Colors.white,
//                       strokeWidth: 1,
//                     );
//                   },
//                 ),
//               ),
//               LineChartBarData(
//                 gradient: LinearGradient(
//                   colors: [
//                     line2Color1,
//                     line2Color2,
//                   ],
//                 ),
//                 spots: reverseSpots(spots2, minSpotY, maxSpotY),
//                 isCurved: true,
//                 isStrokeCapRound: true,
//                 barWidth: 10,
//                 belowBarData: BarAreaData(
//                   show: false,
//                 ),
//                 dotData: FlDotData(
//                   show: true,
//                   getDotPainter: (spot, percent, barData, index) {
//                     return FlDotCirclePainter(
//                       radius: 12,
//                       color: Color.lerp(
//                         line2Color1,
//                         line2Color2,
//                         percent / 100,
//                       )!,
//                       strokeColor: Colors.white,
//                       strokeWidth: 1,
//                     );
//                   },
//                 ),
//               ),
//             ],
//             minY: 0,
//             maxY: maxSpotY + minSpotY,
//             titlesData: FlTitlesData(
//               leftTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   getTitlesWidget: leftTitleWidgets,
//                   reservedSize: 38,
//                 ),
//               ),
//               rightTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   getTitlesWidget: rightTitleWidgets,
//                   reservedSize: 30,
//                 ),
//               ),
//               bottomTitles: const AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),
//               topTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   reservedSize: 32,
//                   getTitlesWidget: topTitleWidgets,
//                 ),
//               ),
//             ),
//             gridData: FlGridData(
//               show: true,
//               drawVerticalLine: true,
//               checkToShowHorizontalLine: (value) {
//                 final intValue = reverseY(value, minSpotY, maxSpotY).toInt();

//                 if (intValue == (maxSpotY + minSpotY).toInt()) {
//                   return false;
//                 }

//                 return true;
//               },
//             ),
//             borderData: FlBorderData(
//               show: true,
//               border: const Border(
//                 left: BorderSide(color: AppColors.borderColor),
//                 top: BorderSide(color: AppColors.borderColor),
//                 bottom: BorderSide(color: Colors.transparent),
//                 right: BorderSide(color: Colors.transparent),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   double reverseY(double y, double minX, double maxX) {
//     return (maxX + minX) - y;
//   }

//   List<FlSpot> reverseSpots(List<FlSpot> inputSpots, double minY, double maxY) {
//     return inputSpots.map((spot) {
//       return spot.copyWith(y: (maxY + minY) - spot.y);
//     }).toList();
//   }
// }
