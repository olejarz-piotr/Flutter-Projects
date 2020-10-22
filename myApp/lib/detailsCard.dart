import 'package:flutter/material.dart';
import 'activities.dart';

class Details extends StatefulWidget {
  final int pk;
  final String firstName;
  final String lastName;
  final String username;
  final String membershipDate;
  final String name;
  final String nickname;
  final String alternateNames;
  final String iauCode;
  final String acronym;
  final String homepageUrl;
  final double longitude;
  final double latitude;
  final double height;
  final String line1;
  final String line2;
  final double zipCode;
  final String stateProvince;
  final String country;
  final String timeZoneId;
  final String timeZoneName;
  final int timeZoneOffset;
  String continent;
  List<String> telescopes;

  List<String> images;
  int isActive;
  int index;

  Details(
    @required this.pk,
    @required this.firstName,
    @required this.lastName,
    @required this.username,
    @required this.membershipDate,
    @required this.name,
    @required this.nickname,
    @required this.alternateNames,
    @required this.iauCode,
    @required this.acronym,
    @required this.homepageUrl,
    @required this.longitude,
    @required this.latitude,
    @required this.height,
    @required this.line1,
    @required this.line2,
    @required this.zipCode,
    @required this.stateProvince,
    @required this.country,
    @required this.timeZoneId,
    @required this.timeZoneName,
    @required this.timeZoneOffset,
    @required this.continent,
    @required this.telescopes,
    @required this.images,
    @required this.isActive,
    @required this.index,
  );

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  void _onSelected(int index) {
    if (Activities.savedList.contains(index.toString())) {
      Activities.savedList.remove(index.toString());
    } else {
      Activities.savedList.add(index.toString());
    }
    setState(() {
      Activities.save(Activities.savedList);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.favorite,
                  color: Activities.savedList.contains(widget.index.toString())
                      ? Colors.redAccent
                      : Colors.grey),
              onPressed: () {
                _onSelected(widget.index);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Card(
            child: Column(
              children: <Widget>[
                if (widget.pk != null)
                  ListTile(
                    title: Text("pk"),
                    subtitle: Text(widget.pk.toString()),
                  ),
                if (widget.firstName != '')
                  ListTile(
                    title: Text("First Name"),
                    subtitle: Text(widget.firstName),
                  ),
                if (widget.lastName != '')
                  ListTile(
                    title: Text("Last Name"),
                    subtitle: Text(widget.lastName),
                  ),
                if (widget.username != '')
                  ListTile(
                    title: Text("Username"),
                    subtitle: Text(widget.username),
                  ),
                if (widget.membershipDate != '')
                  ListTile(
                    title: Text("Membership Date"),
                    subtitle: Text(widget.membershipDate),
                  ),
                if (widget.name != '')
                  ListTile(
                    title: Text('Name'),
                    subtitle: Text(widget.name),
                  ),
                if (widget.nickname != '')
                  ListTile(
                    title: Text('Nickname'),
                    subtitle: Text(widget.nickname),
                  ),
                if (widget.alternateNames != '')
                  ListTile(
                    title: Text('Alternate Names'),
                    subtitle: Text(widget.alternateNames),
                  ),
                if (widget.iauCode != '')
                  ListTile(
                    title: Text('IAU Code'),
                    subtitle: Text(widget.iauCode),
                  ),
                if (widget.acronym != '')
                  ListTile(
                    title: Text('Acronym'),
                    subtitle: Text(widget.acronym),
                  ),
                if (widget.homepageUrl != '')
                  ListTile(
                    title: Text('Homepage'),
                    subtitle: Text(widget.homepageUrl),
                  ),
                if (widget.longitude != null)
                  ListTile(
                    title: Text('Longitude'),
                    subtitle: Text(widget.longitude.toString()),
                  ),
                if (widget.latitude != null)
                  ListTile(
                    title: Text('Latitude'),
                    subtitle: Text(widget.latitude.toString()),
                  ),
                if (widget.line1 != '')
                  ListTile(
                    title: Text('Address Line 1'),
                    subtitle: Text(widget.line1),
                  ),
                if (widget.line2 != '')
                  ListTile(
                    title: Text('Address Line 2'),
                    subtitle: Text(widget.line2),
                  ),
                if (widget.zipCode != null)
                  ListTile(
                    title: Text('Zip Code'),
                    subtitle: Text(widget.zipCode.toString()),
                  ),
                if (widget.stateProvince != '')
                  ListTile(
                    title: Text('State Province'),
                    subtitle: Text(widget.stateProvince),
                  ),
                if (widget.country != '')
                  ListTile(
                    title: Text('Country'),
                    subtitle: Text(widget.country),
                  ),
                if (widget.timeZoneId != '')
                  ListTile(
                    title: Text('Time Zone ID'),
                    subtitle: Text(widget.timeZoneId),
                  ),
                if (widget.timeZoneName != '')
                  ListTile(
                    title: Text('Time Zone Name'),
                    subtitle: Text(widget.timeZoneName),
                  ),
                if (widget.timeZoneOffset != null)
                  ListTile(
                    title: Text('Time Zone Offset'),
                    subtitle: Text(widget.timeZoneOffset.toString()),
                  ),
                if (widget.continent != '')
                  ListTile(
                    title: Text('Continent'),
                    subtitle: Text(widget.continent),
                  ),
                if (widget.telescopes[0] != '[]')
                  ListTile(
                      title: Text('Telescopes'),
                      subtitle: Text(widget.telescopes
                          .toString()
                          .replaceAll(',', '\n')
                          .replaceAll('[', '')
                          .replaceAll(']', ''))),
                if (widget.images[0] != '[]')
                  ListTile(
                      title: Text('Images'),
                      subtitle: Text(widget.images
                          .toString()
                          .replaceAll(',', '\n')
                          .replaceAll('[', '')
                          .replaceAll(']', ''))),
                ListTile(
                  title: Text('Is Active?'),
                  subtitle: Text(widget.isActive.toString()),
                ),
                SizedBox(height: 50),
                Text("Favourite"),
                Container(
                    child: IconButton(
                        icon: Icon(Icons.favorite,
                            color: Activities.savedList
                                    .contains(widget.index.toString())
                                ? Colors.redAccent
                                : Colors.grey),
                        onPressed: () {
                          _onSelected(widget.index);
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
