import 'package:flutter/material.dart';
import 'package:flutter_rekrutacja/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Exoplanets extends StatefulWidget {
  @override
  _ExoplanetsState createState() => _ExoplanetsState();

  static String apiUrl =
      "https://api.arcsecond.io/exoplanets/?page_size=20&page=1&format=json";
}

class _ExoplanetsState extends State<Exoplanets> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          fetchUsers(Exoplanets.apiUrl);
        });
      }
    });
  }

//  List<String> names = new List();

  Future<List<dynamic>> fetchUsers(apiUrl) async {
    var result = await http.get(apiUrl);

    //   names.add(json.decode(result.body)['name']);
    //   print(names);

    apiUrl = json.decode(result.body)['next'];
    //  print(apiUrl);
    return json.decode(result.body)['results'];
  }

  String _name(dynamic user) {
    MyApp.search.add(user['name']);

    //  names.add(user['name']);
    return user['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(Exoplanets.apiUrl),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(title: Text(_name(snapshot.data[index])))
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
