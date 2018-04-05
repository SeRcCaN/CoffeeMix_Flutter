import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new LatteData(),
  ));
}

class LatteData extends StatefulWidget {
  @override
  CoffeeMixState createState() => new CoffeeMixState();
}

class CoffeeMixState extends State<LatteData> {
  final String url = "http://www.sercanagir.com/Coffee.json";
  List data;

  Future<String> getJson() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      data = json.decode(res.body);
    });

    return "Succees";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              padding: new EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Center(
                      child: new Text(data[index]["coffeeName"],
                          style: new TextStyle(
                              fontFamily: 'Avenir Next',
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                    height: 340.0,
                    decoration: new BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: new DecorationImage(
                        image: new NetworkImage(data[index]["coffeeImg"]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(15.0)),
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10.0,
                            offset: new Offset(-1.0, 8.0)),
                      ],
                    ),
                  ),
                  new Container(
                    height: 8.0,
                  ),
                  new Divider()
                ],
              ),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getJson();
  }
}
