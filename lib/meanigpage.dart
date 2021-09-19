import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/hinduname.dart';
import 'models/hinduname.dart';

class Meaning extends StatefulWidget {
  final List<HinduCatResponse>? hinduresp;
  final HinduCatResponse? personselected;
  // final int indexno;
  const Meaning({
    Key? key,
    this.hinduresp,
    this.personselected,
  }) : super(key: key);

  @override
  _MeaningState createState() => _MeaningState();
}

class _MeaningState extends State<Meaning> {
  @override
  void initState() {
    print("Details Arr ${widget.hinduresp?.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(child: Text("${widget.hinduresp?[widget.indexno].meaning}")),
    // );
    return Scaffold(
      body: Center(child: Text("${widget.personselected?.meaning}")),
    );
  }
}
