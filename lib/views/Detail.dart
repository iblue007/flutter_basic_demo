import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String id;

  Detail(this.id);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("列表详情"),
        ),
        body: new Center(
          child: new Text("这是详情页" + "id=" + id),
        )
    );
  }
}
