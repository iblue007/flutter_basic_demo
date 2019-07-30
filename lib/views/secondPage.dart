import 'package:flutter/material.dart';
import '../components/input.dart';

class secondPage extends StatefulWidget {
  @override
  SecondPageState createState() => new SecondPageState();
}

class SecondPageState extends State<secondPage> {
  TextEditingController controller;
  String active = "test";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //controller = new TextEditingController()
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("界面2"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: controller,
              onChanged: _onChanged,
            ),
            new input(active: active)
          ],
        ),
      ),
    );
  }

  void _onChanged(String value) {
    setState(() {
      active = value;
    });
  }
}
