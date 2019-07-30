import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import '../views/Detail.dart';

class list extends StatefulWidget {
  @override
  ListState createState() => new ListState();
}

class ListState extends State<list> {
  List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new Container(
            padding: new EdgeInsets.all(10.0),
            child: new ListTile(
              subtitle: new Container(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Expanded(
                              child: new Text(data[index]["title"],
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0)))
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Text("时间:"),
                              new Text("2012-12-12 12:12")
                            ],
                          )
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          new Container(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                            child:
                                new Text("id:" + data[index]["id"].toString()),
                          )
                        ],
                      )
                    ]),
              ),
              trailing: new Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ), //显示右侧的箭头，不显示则传null
              onTap: () => _onTap(data[index]["id"].toString()),
            ),
          ),
        );
      },
    );
  }

  void _onTap(String id) {
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return new Detail(id);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(
            opacity: animation,
            child: new SlideTransition(
                position: new Tween(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child),
          );
        }));
  }

  getData() async {
    var url = "http://jsonplaceholder.typicode.com/posts";
    var httpClient = new HttpClient();
    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        result = jsonDecode(json);
      } else {
        result =
            "error getting json data:\n http status ${response.statusCode}";
      }
    } catch (exception) {
      result = "fail getting json data";
    }
    if (!mounted) return;

    setState(() {
      data = result;
    });
  }
}
