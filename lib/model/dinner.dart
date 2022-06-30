import 'package:flutter/material.dart';

class Dinner {
  final Color colors;
  final String teams;
  double price;

  Dinner({
    required this.colors,
    required this.teams,
    required this.price,
  });
}

final DinnerTeamLists = [
  Dinner(
    colors: Colors.blue,
    teams: "Me",
    price: 200.86,
  ),
  Dinner(
    colors: Colors.purple,
    teams: "Cody",
    price: 450,
  ),
  Dinner(
    colors: Colors.orange.shade300,
    teams: "Khalifa",
    price: 100,
  ),
];
