import 'package:flutter/material.dart';
import 'package:myflutterapp/Views/MainPageTabs/AnalysisPageView.dart';
import 'package:myflutterapp/Views/MainPageTabs/EventPageView.dart';
import 'package:myflutterapp/Views/MainPageTabs/HomePageView.dart';
import 'package:myflutterapp/Views/MainPageTabs/SettingsPageView.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text(widget.title),
          ),
          bottomNavigationBar: const Padding(
            padding: EdgeInsets.all(10),
            child: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.settings)),
                Tab(icon: Icon(Icons.analytics)),
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.event_available)),
                Tab(icon: Icon(Icons.history)),

                // Tab(
                //     child: Column(
                //     children: [Icon(Icons.settings), Text('Setting')],
                // )),
                // //Tab(icon: Icon(Icons.settings)),
                // Tab(
                //     child: Column(
                //     children: [Icon(Icons.analytics), Text('Analyse')],
                // )),
                // Tab(
                //     child: Column(
                //     children: [Icon(Icons.home), Text('Home')],
                // )),
                // Tab(
                //     child: Column(
                //     children: [Icon(Icons.event_available), Text('Events')],
                // )),
                // Tab(
                //     child: Column(
                //     children: [Icon(Icons.history), Text('History')],
                // )),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SettingsPage(),
              AnalysisPage(),
              HomePage(),
              HomePageYield(),
              Icon(Icons.history),
            ],
          )),
    );
  }
}
