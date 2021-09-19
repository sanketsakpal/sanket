import 'dart:convert';
import 'card.dart';
import 'models/hinduname.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common.dart';
import 'package:http/http.dart' as http;

import 'models/firstapi.dart';
import 'namkarnapi.dart';

class Firstapi extends StatefulWidget {
  const Firstapi({Key? key}) : super(key: key);

  @override
  _FirstapiState createState() => _FirstapiState();
}

class _FirstapiState extends State<Firstapi> {
  List<CategoryName> cateNameId = [];
  callapi() async {
    var resp = await http.get(
        Uri.parse("http://mapi.trycatchtech.com/v1/naamkaran/category_list"));
    var jresp = jsonDecode(resp.body);
    setState(() {
      for (var item in jresp) {
        cateNameId.add(
          CategoryName.fromJson(item),
        );
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callapi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              for (var i = 0; i < cateNameId.length; i++) conex(indexno: i)
            ],
          ),
        ),
      ),
    );
  }

  Widget conex({required int indexno}) {
    return Card(
      elevation: 50,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.height * 0.6,
        child: ElevatedButton(
          onPressed: () {
            common.Categoryid = "${cateNameId[indexno].id}";
            common.Categoryname = "${cateNameId[indexno].catName}";
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => const Cardex()));
          },
          child: Text(
            cateNameId[indexno].catName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24),
          ),
        ),
      ),
    );
  }
}
