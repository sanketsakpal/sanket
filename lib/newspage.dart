import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/newsapi.dart';
import 'package:http/http.dart' as http;

class Newspage extends StatefulWidget {
  const Newspage({Key? key}) : super(key: key);

  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  List<Articles>? articles;
  callapi() async {
    var resp = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2021-09-12&to=2021-09-12&sortBy=popularity&apiKey=3a7b61f7f0fe4b329d1d6a2a97e75d41"));
    print(resp.body);
    Newsrespone kkr = Newsrespone.fromJson(jsonDecode(resp.body));
    print("data length-->${kkr.articles?.length}");
    setState(() {
      articles = kkr.articles ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    callapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(articles?[index].title ?? ""),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            },
            itemCount: articles!.length));
  }
}
