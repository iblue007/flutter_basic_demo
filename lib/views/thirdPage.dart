import 'package:flutter/material.dart';

class thirdPage extends StatefulWidget {

  @override
  ThirdPageState createState() => new ThirdPageState();
}

class ThirdPageState extends State<thirdPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("界面3"),
      ),
      body: new Center(
        child: new Text("这是第三个界面"),
      ),
    );
  }
}
