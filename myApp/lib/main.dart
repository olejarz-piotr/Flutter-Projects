import 'package:flutter/material.dart';
import 'package:flutter_rekrutacja/Search.dart';
import 'package:flutter_rekrutacja/activities.dart';
import 'package:flutter_rekrutacja/exoplanets.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static List<String> search = new List();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search(MyApp.search));
              },
              icon: Icon(Icons.search),
            )
          ],
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "EXOPLANETS",
              ),
              Tab(
                text: "ACTIVITIES",
              ),
            ],
          ),
          title: Text('Flutter Rekrutacja'),
        ),
        body: TabBarView(
          children: <Widget>[
            Exoplanets(),
            Container(
              child: Activities(),
            )
          ],
        ),
      ),
    );
  }
}
