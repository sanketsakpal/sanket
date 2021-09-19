import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/randomapi.dart';
import 'package:http/http.dart' as http;

class Randomapi extends StatefulWidget {
  const Randomapi({Key? key}) : super(key: key);

  @override
  _RandomapiState createState() => _RandomapiState();
}

class _RandomapiState extends State<Randomapi> {
  Random? kkr;
  List<Random> ddr = [];
  var arre = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadapi();
  }

  loadapi() async {
    var reps = await http.get(
        Uri.parse("https://random-data-api.com/api/users/random_user?size=3"));
    print(reps.body);
    arre = jsonDecode(reps.body);
    setState(() {
      // kkr = Random.fromJson(jsonDecode(reps.body));
      for (var item in arre) {
        ddr.add(Random.fromJson(item));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: ddr.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text("${ddr[index].firstName}"),
              );
            }));
  }
}
