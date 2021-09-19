import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weatherresponse.dart';
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WEatherState createState() => _WEatherState();
}

class _WEatherState extends State<Weather> {
  Map<String, dynamic> coord = Map<String, dynamic>();
  WhetherjsonData? weather;
  @override
  void initState() {
    super.initState();
    callapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(""),
        ),
      ),
    );
  }

  callapi() async {
    var resp = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=gujrat&appid=042a10218a6134f1de90a2dfccfc7b07"));

    var json = jsonDecode(resp.body);
    print(json);
    
    // setState(() {
    //   WhetherjsonData weather = WhetherjsonData.fromJson(jsonDecode(resp.body));
    // });
    // WhetherjsonData weather = WhetherjsonData.fromJson(jsonDecode(resp.body));
  }
}
