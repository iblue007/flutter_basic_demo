import 'package:flutter/material.dart';
import './views/firstPage.dart';
import './views/secondPage.dart';
import './views/thirdPage.dart';
import './views/Detail.dart';

void main() => runApp(new MaterialApp(
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        "/detail": (BuildContext context) => new Detail("0")
      },
    ));

class MyHomePage extends StatefulWidget {
  @override
  _myHomePageState createState() => new _myHomePageState();
}

class _myHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new TabBarView(controller: controller, children: <Widget>[
        new firstPage(),
        new secondPage(),
        new thirdPage()
      ]),
      bottomNavigationBar: new Material(
        color: Colors.orangeAccent,
        child: new TabBar(controller: controller, tabs: <Tab>[
          new Tab(
            text: "列表",
            icon: new Icon(Icons.home),
          ),
          new Tab(
            text: "通知",
            icon: new Icon(Icons.message),
          ),
          new Tab(
            text: "我的",
            icon: new Icon(Icons.cloud),
          )
        ]),
      ),
    );
  }
}
