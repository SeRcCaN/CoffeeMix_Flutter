import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../extensions/Coffee.dart';
import 'DetailPage.dart';

void main() {
  runApp(new MaterialApp(
    home: new SmoothieData(),
  ));
}

class SmoothieData extends StatefulWidget {
  @override
  CoffeeMixState createState() => new CoffeeMixState();
}

class CoffeeMixState extends State<SmoothieData> {
  final String url = "http://www.sercanagir.com/Coffee.json";
  List<Coffee> _coffee = [];

  _loadCoffees() async {
    String response = await createHttpClient()
        .read(url, headers: {"Accept": "application/json"});

    setState(() {
      _coffee = Coffee.allFromResponse(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: coffeList());
  }

  Widget coffeList() {
    return new ListView.builder(
        itemCount: _coffee == null ? 0 : _coffee.length,
        itemBuilder: (BuildContext context, int index) {
          Coffee smoothies = _coffee[index];

          return new Container(
            padding: new EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10.0, bottom: 3.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new GestureDetector(
                    onTap: () {
                      setState(() {
                        _navigateToFriendDetails(smoothies);
                      });
                    },
                    child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Text(
                        smoothies.coffeeName,
                        maxLines: 2,
                        style: new TextStyle(
                            fontFamily: 'Avenir Next',
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  height: 340.0,
                  width: 375.0,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    image: new DecorationImage(
                      image: new NetworkImage(smoothies.coffeeImg),
                      fit: BoxFit.cover,
                    ),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(20.0)),
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
              ],
            ),
          );
        });
  }

  _navigateToFriendDetails(Coffee coffee) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (c) {
          return new CoffeDetailPage(coffee);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadCoffees();
  }
}
