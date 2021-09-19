import 'dart:io';

import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';

class CameraGallaryExample extends StatefulWidget {
  const CameraGallaryExample({Key? key}) : super(key: key);

  @override
  _CameraGallaryExampleState createState() => _CameraGallaryExampleState();
}

class _CameraGallaryExampleState extends State<CameraGallaryExample> {
  Media? selectedimg;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                List<Media>? selectedimagearr = await ImagesPicker.openCamera();
                parseselectedimage(selectedimagearr);
              },
              child: Text("camera"),
            ),
            ElevatedButton(
              onPressed: () async {
                List<Media>? selectedimagearr =
                    await ImagesPicker.pick(count: 5);
                parseselectedimage(selectedimagearr);
              },
              child: Text("gallary"),
            ),
            if (selectedimg != null) Image.file(File(selectedimg!.path)),
            // GestureDetector(
            //   child: Container(
            //     height: 300,
            //     width: 300,
            //     color: Colors.yellow,
            //   ),
            //   onVerticalDragStart: (temp) {
            //     print("onVerticalDragStart");
            //   },
            //   onVerticalDragEnd: (temp) {
            //     print("onVerticalDragEnd");
            //   },
            // )
          ],
        ),
      )),
    );
  }

  parseselectedimage(List<Media>? selectedimagearr) {
    if (selectedimagearr != null && selectedimagearr.length > 0) {
      print("selectediamge $selectedimagearr");
      Media m = selectedimagearr[0];
      setState(() {
        selectedimg = m;
      });
      print("image path ${m.path}");
    }
  }
}
