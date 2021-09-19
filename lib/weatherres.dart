import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/weatherresponse.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  // var coord = {};
  WhetherjsonData? weather;
  @override
  void initState() {
    super.initState();
    callapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  callapi() async {
    var resp = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=gujrat&appid=5dec696425a7e9936e130973aa4c0f58"));

    // var jresp = jsonDecode(resp.body);
    setState(() {
      WhetherjsonData weather = WhetherjsonData.fromJson(jsonDecode(resp.body));
    });
    print(weather?.name);
  }
}
