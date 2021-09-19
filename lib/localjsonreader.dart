import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import 'models/localjson.dart';

class Localjson extends StatefulWidget {
  const Localjson({Key? key}) : super(key: key);

  @override
  _LocaljsonState createState() => _LocaljsonState();
}

class _LocaljsonState extends State<Localjson> {
  List<Times>? times;
  Example? kkr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  loaddata() async {
    String resp = await rootBundle.loadString("assets/user.json");
    print("rep is${resp}");
    // var response = jsonDecode(resp);
    setState(() {
      kkr = Example.fromJson(jsonDecode(resp));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: kkr?.times?.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: Text("${kkr?.times![index].username}"),
              subtitle: Text("${kkr?.times![index].age}"),
            );
          }),
    );
  }
}
