import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myflutterapp/Models/customWidgets/customControls.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//Vielleicht mit DataTable machen https://www.youtube.com/watch?v=ktTajqbhIcY

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInverter(
                onTap: () {},
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  CustomMeasurmentText(text: '200'),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color.fromARGB(255, 121, 119, 100)),
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//     SingleChildScrollView(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             children: [CustomInverter(onTap: () {})],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               CustomMeasurmentText(text: '200'),
//               CustomMeasurmentText(text: '250'),
//               CustomMeasurmentText(text: '206'),
//               CustomMeasurmentText(text: '500'),
//             ],
//           ),
//           Column(
//             children: [
//               Container(
//                   decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       color: const Color.fromARGB(255, 121, 119, 100)),
//                   margin: EdgeInsets.all(10.0),
//                   child: Icon(
//                     Icons.arrow_forward,
//                   )),
//               Container(
//                   decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       color: const Color.fromARGB(255, 121, 119, 100)),
//                   margin: EdgeInsets.all(10.0),
//                   child: Icon(
//                     Icons.arrow_forward,
//                   )),
//               Container(
//                   decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       color: const Color.fromARGB(255, 121, 119, 100)),
//                   margin: EdgeInsets.all(10.0),
//                   child: Icon(
//                     Icons.arrow_forward,
//                   )),
//               Container(
//                   decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       color: const Color.fromARGB(255, 121, 119, 100)),
//                   margin: EdgeInsets.all(10.0),
//                   child: Icon(
//                     Icons.arrow_forward,
//                   )),
//             ],
//           ),
//           Expanded(
//               child: Column(
//             children: [
//               CustomButton(
//                   onTap: () {},
//                   text: 'PV-Anlage',
//                   iconLeft: Icons.sunny,
//                   iconRight: Icons.circle),
//               CustomButton(
//                 onTap: () {},
//                 text: 'Verbrauch',
//                 iconLeft: Icons.surfing,
//                 iconRight: Icons.circle,
//               ),
//               CustomButton(
//                 onTap: () {},
//                 text: 'Batterie',
//                 iconLeft: Icons.battery_0_bar,
//                 iconRight: Icons.circle,
//               ),
//               CustomButton(
//                 onTap: () {},
//                 text: 'Netz',
//                 iconLeft: Icons.energy_savings_leaf,
//                 iconRight: Icons.circle,
//               ),
//             ],
//           )),
//         ],
//       ),
//     );
//   }
// }

/*   
        
        Table(
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(4),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            Column(children: [CustomInverter(onTap: () {})]),
            Column(children: [
              CustomMeasurmentText(text: '200'),
              CustomMeasurmentText(text: '250'),
              CustomMeasurmentText(text: '206'),
              CustomMeasurmentText(text: '500'),
            ]),
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color.fromARGB(255, 121, 119, 100)),
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_forward,
                    )),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.yellow),
                  margin: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_forward,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.yellow),
                  margin: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_forward,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.yellow),
                  margin: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_forward,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomButton(
                    onTap: () {},
                    text: 'PV-Anlage',
                    iconLeft: Icons.sunny,
                    iconRight: Icons.circle),
                CustomButton(
                  onTap: () {},
                  text: 'Verbrauch',
                  iconLeft: Icons.surfing,
                  iconRight: Icons.circle,
                ),
                CustomButton(
                  onTap: () {},
                  text: 'Batterie',
                  iconLeft: Icons.battery_0_bar,
                  iconRight: Icons.circle,
                ),
                CustomButton(
                  onTap: () {},
                  text: 'Netz',
                  iconLeft: Icons.energy_savings_leaf,
                  iconRight: Icons.circle,
                ),
              ],
            ),
          ],
        ),
      ],
    ));
*/
// return GridView.count(
//   crossAxisCount: 3,
//   children: [
//     Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//               shape: BoxShape.rectangle, color: Colors.yellow),
//           margin: EdgeInsets.all(10.0),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.zero,
//             )),
//             onPressed: () {},
//             child: Text('Button1'),
//           ),
//         ),
//       ],
//     ),
//   ],

/*Ansatz mit Conatiner  */

// return GridView.builder(
//   itemCount: 5,
//   itemBuilder: (BuildContext context, int index) {
//     return Container(
//       //alignment: Alignment.center,
//       decoration:
//           BoxDecoration(shape: BoxShape.rectangle, color: Colors.yellow),
//       margin: EdgeInsets.all(10.0),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.zero,
//         )),
//         onPressed: () {},
//         child: Text('Button $index'),
//       ),
//     );
//   },
//   gridDelegate:
//       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
// );

// return GridView.count(
//   padding: const EdgeInsets.all(20),
//   crossAxisCount: 3,
//   children: [
//     ListView()
// GridTile(
//   child: ElevatedButton(
//     child: const Text('Button5'),
//     onPressed: () {

//     },
//   ),
// ),
// GridTile(
//   child: ElevatedButton(
//     child: const Text('Button6'),
//     onPressed: () {

//     },
//   ),
// ),
// GridTile(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       ElevatedButton(
//           onPressed:() {

//           },
//           child: Text('Box1'),
//         ),
//       ElevatedButton(
//           onPressed:() {

//           },
//           child: Text('Box2'),
//       ),
//       ElevatedButton(
//           onPressed:() {

//           },
//           child: Text('Box3'),
//       ),
//       ElevatedButton(
//           onPressed:() {

//           },
//           child: Text('Box4'),
//       ),
//     ],
//   ),
// ),
