import 'package:flutter/material.dart';
import './pages/Latte.dart';

void main() {
  runApp(new CoffeMix());
}

class CoffeMix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 4,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(
              "COFFEEMIX",
              style: new TextStyle(
                  fontFamily: 'Avenir Next',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: new Color(0xFFD7413E),
            bottom: new TabBar(
              tabs: [
                new Tab(
                  child: new Text(
                    'LATTE',
                    style: new TextStyle(
                        fontFamily: 'Avenir Next',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                new Tab(
                  child: new Text(
                    'MOCHA',
                    style: new TextStyle(
                        fontFamily: 'Avenir Next',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                new Tab(
                  child: new Text(
                    'MILKSHAKE',
                    style: new TextStyle(
                        fontFamily: 'Avenir Next',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                new Tab(
                  child: new Text(
                    'SMOOTHIE',
                    style: new TextStyle(
                        fontFamily: 'Avenir Next',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          body: new TabBarView(
            children: [
              new LatteData(),
              //new Icon(Icons.directions_transit),
              new Icon(Icons.directions_transit),
              new Icon(Icons.directions_bike),
              new Icon(Icons.directions_boat),
            ],
          ),
        ),
      ),
    );
  }
}
