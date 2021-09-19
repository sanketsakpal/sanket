import 'package:flutter/material.dart';
import 'package:flutter_application_1/common.dart';
import 'package:flutter_application_1/namkarnapi.dart';

class Cardex extends StatefulWidget {
  const Cardex({Key? key}) : super(key: key);

  @override
  _CardexState createState() => _CardexState();
}

class _CardexState extends State<Cardex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://media.istockphoto.com/vectors/baby-newborn-hanging-baby-boy-baby-girl-symbols-pink-blue-vector-id1030554078?k=20&m=1030554078&s=612x612&w=0&h=z_mUClgbvpkWQjkgaFF-SEEFE_hBvHSyXx-le_BJ-4Y="),
                fit: BoxFit.fill)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  common.Categorygender = "1";
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const Hindupage()));
                },
                child: Text("boys"),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    common.Categorygender = "2";
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => const Hindupage()));
                  },
                  child: Text("girls")),
            ],
          ),
        ),
      ),
    );
  }
}
