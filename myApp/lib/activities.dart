import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter_rekrutacja/detailsCard.dart';
import 'package:flutter_rekrutacja/main.dart';

class Activities extends StatefulWidget {

  @override
  _ActivitiesState createState() => _ActivitiesState();

  static List<String> indexes = new List();

  static save(List<String> indexes) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('key', indexes);

  }

  static List<String> savedList = new List();

  static getData() async {
    final prefs = await SharedPreferences.getInstance();


    var likes = prefs.getStringList('key');
    savedList=likes.cast<String>();
  }

}

class _ActivitiesState extends State<Activities> {


  String apiUrl =
      "https://api.arcsecond.io/observingsites/updates/?format=json&page=1&page_size=20";

  Future<List<dynamic>> fetchData(apiUrl) async {
    var result = await http.get(apiUrl);
    var results = json.decode(utf8.decode(result.bodyBytes))['results'];
    return results;
  }

  String _lastName(dynamic name) {
    return name['profile']['last_name'];
  }

  int _isActive(dynamic name) {
    return name['observing_site']['is_active'];
  }


  String _getTargetName(dynamic name) {
    MyApp.search.add(name['observing_site']['name']);

    return name['observing_site']['name'];
  }

  String _targetDate(dynamic date) {
    date = date['date'];

    return date.substring(0, 10);
  }

  int _getPk(dynamic name) {

    return name['profile']['pk'];
  }

  String _getFirstName(dynamic name) {
    return name['profile']['first_name'];
  }

  String _getUsername(dynamic name) {
    return name['profile']['username'];
  }

  String _getMembershipDate(dynamic date) {
    date = date['profile']['membership_date'];
    return date.substring(0, 10);
  }

  String _getNickname(dynamic name) {
    return name['observing_site']['nickname'];
  }

  String _getAlternateNames(dynamic name) {
    return name['observing_site']['alternate_names'];
  }

  String _getIauCode(dynamic name) {
    return name['observing_site']['IAUCode'];
  }

  String _getAcronym(dynamic name) {
    return name['observing_site']['acronym'];
  }

  String _getHomepage(dynamic name) {
    return name['observing_site']['homepage_url'];
  }

  double _getLongitude(dynamic name) {
    return name['observing_site']['coordinates']['longitude'];
  }

  double _getLatitude(dynamic name) {
    return name['observing_site']['coordinates']['latitude'];
  }

  double _getHeight(dynamic name) {
    return name['observing_site']['coordinates']['height'];
  }

  String _getLine1(dynamic name) {
    return name['observing_site']['address']['line_1'];
  }

  String _getLine2(dynamic name) {
    return name['observing_site']['address']['line_2'];
  }

  double _getZipCode(dynamic name) {
    return name['observing_site']['address']['zip_code'];
  }

  String _getStateProvince(dynamic name) {
    return name['observing_site']['address']['state_province'];
  }

  String _getCountry(dynamic name) {
    return name['observing_site']['address']['country'];
  }

  String _getTimeZoneId(dynamic name) {
    return name['observing_site']['address']['time_zone_id'];
  }

  String _getTimeZoneName(dynamic name) {
    return name['observing_site']['address']['time_zone_name'];
  }

  int _getTimeZoneOffset(dynamic name) {
    return name['observing_site']['address']['time_zone_offset'];
  }

  String _getContinent(dynamic name) {
    return name['observing_site']['address']['continent'];
  }


  List<String> _getTelescopes(dynamic name) {
    List<String> telescopes = new List();


    telescopes.add(name['observing_site']['telescopes'].toString());

    return telescopes;
  }

  List<String> _getImages(dynamic name) {
    List<String> images = new List();


    images.add(name['observing_site']['images'].toString());

    return images;
  }


  void _onSelected(int index) {

    if(Activities.savedList.contains(index.toString())){

  Activities.savedList.remove(index.toString());

    }else {

        Activities.savedList.add(index.toString());

    }
setState(() {
  Activities.save(Activities.savedList);

});

    }

    @override
    Widget build(BuildContext context) {
      return Container(

          color: Colors.grey,
          child: FutureBuilder<List<dynamic>>(
            future: fetchData(apiUrl),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(

                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                  ),
                  itemBuilder: (context, index) {
                    return Container(

                        child: Material(
                          color: Colors.white,
                          child: new InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      Details(
                                        _getPk(snapshot.data[index]),
                                        _getFirstName(snapshot.data[index]),
                                        _lastName(snapshot.data[index]),
                                        _getUsername(snapshot.data[index]),
                                        _getMembershipDate(
                                            snapshot.data[index]),
                                        _getTargetName(snapshot.data[index]),
                                        _getNickname(snapshot.data[index]),
                                        _getAlternateNames(
                                            snapshot.data[index]),
                                        _getIauCode(snapshot.data[index]),
                                        _getAcronym(snapshot.data[index]),
                                        _getHomepage(snapshot.data[index]),
                                        _getLongitude(snapshot.data[index]),
                                        _getLatitude(snapshot.data[index]),
                                        _getHeight(snapshot.data[index]),
                                        _getLine1(snapshot.data[index]),
                                        _getLine2(snapshot.data[index]),
                                        _getZipCode(snapshot.data[index]),
                                        _getStateProvince(snapshot.data[index]),
                                        _getCountry(snapshot.data[index]),
                                        _getTimeZoneId(snapshot.data[index]),
                                        _getTimeZoneName(snapshot.data[index]),
                                        _getTimeZoneOffset(
                                            snapshot.data[index]),
                                        _getContinent(snapshot.data[index]),
                                        _getTelescopes(snapshot.data[index]),
                                        _getImages(snapshot.data[index]),
                                        _isActive(snapshot.data[index]),
                                        index,

                                      )));
                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Theme
                                                .of(context)
                                                .primaryColor,
                                            width: 1)),
                                    padding: EdgeInsets.all(2),
                                    child: IconButton(
                                        icon: Icon(
                                            Icons.favorite,
                                            color: Activities.savedList.contains(
                                                index.toString())
                                                ? Colors.redAccent
                                                : Colors.grey),
                                        onPressed: () {
                                          _onSelected(index);
                                        })),
                                Flexible(
                                  child: Container(

                                    child: Center(
                                      child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              _getTargetName(
                                                  snapshot.data[index]),
                                              softWrap: true,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(_targetDate(
                                                snapshot.data[index]),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.start),
                                          ]),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ));
    }
  }
