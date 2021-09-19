import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common.dart';
import 'package:flutter_application_1/meanigpage.dart';

import 'package:http/http.dart' as http;

import 'models/hinduname.dart';

//if the response is dirctly start with arry without haveing any parent name than use for loop/for in.
class Hindupage extends StatefulWidget {
  const Hindupage({Key? key}) : super(key: key);

  @override
  _HindupageState createState() => _HindupageState();
}

class _HindupageState extends State<Hindupage> {
  List arrrep = [];
  List<HinduCatResponse> hinduarr = [];
  @override
  void initState() {
    callapi();
  }

  callapi() async {
    var resp = await http.get(
      Uri.parse(
          "http://mapi.trycatchtech.com/v1/naamkaran/post_list_by_cat_and_gender?category_id=${common.Categoryid}&gender=${common.Categorygender}"),
    );
    print("here ---> ${resp.body}");
    arrrep = jsonDecode(resp.body);
    setState(() {
      for (var item in arrrep) {
        hinduarr.add(HinduCatResponse.fromJson(item));
      }
    });
    // HinduCatResponse hd = HinduCatResponse.fromJson(jsonDecode(resp.body));
    setState(() {
      // print("here ==${arrrep[1]["name"]}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.amber,
          body: ListView.builder(
              itemCount: hinduarr.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(hinduarr[index].name),
                  trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => Meaning(
                                      hinduresp: hinduarr,
                                      personselected: hinduarr[index],
                                      // indexno: index,
                                    )));
                      },
                      child: Text("Meaning")),
                );
              })),
    );
  }
}
