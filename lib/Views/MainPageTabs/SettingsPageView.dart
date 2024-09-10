import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myflutterapp/Models/systemInfo.dart';

Future<Systeminfo> fetchData() async {
  final response =
      await http.get(Uri.parse('http://10.20.141.32/api/v1/systeminfo'));

  if (response.statusCode == 200) {
    return Systeminfo.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

//Vielleicht mit DataTable machen https://www.youtube.com/watch?v=ktTajqbhIcY

class _SettingsPageState extends State<SettingsPage> {
  late Future<Systeminfo> systeminfo;

  @override
  void initState() {
    super.initState();
    systeminfo = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Systeminfo>(
      future: systeminfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.deviceInfo.serialNumber);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
