import 'package:flutter/material.dart';
import 'package:quibble/views/restaurant/components/menu.dart';
import 'package:quibble/views/restaurant/components/restaurantdetails.dart';

class Body extends StatefulWidget {
  final String restaurant;
  const Body({super.key, required this.restaurant});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        RestaurantDetails(
          restaurant: widget.restaurant,
        ),
        Menu(restaurant: widget.restaurant)
      ],
    ));
  }
}
