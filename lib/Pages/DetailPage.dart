import 'package:flutter/material.dart';
import '../extensions/Coffee.dart';

class CoffeDetailPage extends StatefulWidget {
  CoffeDetailPage(this.coffee);

  final Coffee coffee;

  @override
  _CoffeDetailPageState createState() => new _CoffeDetailPageState();
}

class _CoffeDetailPageState extends State<CoffeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "COFFEEMIX",
          style: new TextStyle(
              fontFamily: 'Avenir Next',
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: new Color(0xFFD7413E),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Image.network(
              widget.coffee.coffeeImg,
              height: 290.0,
              fit: BoxFit.cover,
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: new Text(widget.coffee.coffeeName,
                  style: new TextStyle(
                      fontFamily: 'Avenir Next',
                      fontSize: 16.0,
                      color: new Color(0xFFD7413E),
                      fontWeight: FontWeight.w700)),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(widget.coffee.coffeeMaterial,
                  style: new TextStyle(
                      fontFamily: 'Avenir Next',
                      fontSize: 13.0,
                      color: new Color(0xFF333333),
                      fontWeight: FontWeight.w700)),
            ),
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Text("Hazırlanışı",
                  style: new TextStyle(
                      fontFamily: 'Avenir Next',
                      fontSize: 16.0,
                      color: new Color(0xFFD7413E),
                      fontWeight: FontWeight.w700)),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(widget.coffee.coffePreparation,
                  style: new TextStyle(
                      fontFamily: 'Avenir Next',
                      fontSize: 13.0,
                      color: new Color(0xFF333333),
                      fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }
}
