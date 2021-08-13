import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location, time='loading', flag, url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{
  
  try{
    Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    
    time = DateFormat.jm().format(now);
  }
  catch(e){
    print('caught error: $e');
    time = 'Time is not available.';
  }

  }

}

