import 'package:flutter/material.dart';
import 'package:myflutterapp/Models/customWidgets/customControls.dart';

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        direction: Axis.vertical,
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
    );
  }
}
