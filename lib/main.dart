import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new CoffeeMixData(),
  ));
}

class CoffeeMixData extends StatefulWidget {
  @override
  CoffeeMixState createState() => new CoffeeMixState();
}

class CoffeeMixState extends State<CoffeeMixData> {
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
      appBar: new AppBar(
        title: new Text("CoffeeMix"),
        backgroundColor: new Color(0xFFD7413E),
      ),
      body: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              padding: new EdgeInsets.all(10.0),
              child: new Column(
                children: <Widget>[
                  new Image.network(data[index]["coffeeImg"]),
                  new Text(data[index]["coffeeName"],
                      style: new TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
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
