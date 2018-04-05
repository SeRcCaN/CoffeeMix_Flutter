import 'dart:convert';
import 'package:meta/meta.dart';

class Coffee {
  Coffee({
    @required this.coffeeName,
    @required this.coffeeImg,
    @required this.coffeeMaterial,
    @required this.coffePreparation,
  });

  final String coffeeName;
  final String coffeeImg;
  final String coffeeMaterial;
  final String coffePreparation;

  static List<Coffee> allFromResponse(String json) {
    return JSON.decode(json).map((obj) => Coffee.fromMap(obj)).toList();
  }

  static Coffee fromMap(Map map) {
    return new Coffee(
      coffeeName: map['coffeeName'],
      coffeeImg: map['coffeeImg'],
      coffeeMaterial: map['coffeeMaterial'],
      coffePreparation: map['coffePreparation'],
    );
  }

  static String _capitalize(String input) {
    return input.substring(0, 1).toUpperCase() + input.substring(1);
  }
}
