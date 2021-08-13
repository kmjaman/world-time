//import 'dart:html';
//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({ Key? key }) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                title: Text(locations[index].location),
                onTap: (){
                  updateTime(index);
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              )
            ),
          );
        },
      ),
    );
  }
}