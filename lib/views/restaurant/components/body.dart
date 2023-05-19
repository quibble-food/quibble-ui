import 'package:flutter/material.dart';
import 'menu.dart';
import 'restaurantdetails.dart';

class Body extends StatefulWidget {
  final String restaurant;
  const Body({super.key, required this.restaurant});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 0,
            child: RestaurantDetails(
              restaurant: widget.restaurant,
            )),
        Expanded(
            flex: 1,
            child: Menu(
              restaurant: widget.restaurant,
            )),
      ]),
    );
  }
}
