import 'package:flutter/material.dart';

class RestaurantDetails extends StatefulWidget {
  final String restaurant;
  const RestaurantDetails({super.key, required this.restaurant});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.82,
      height: screenSize.height * 0.22,
      margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 25),
    );
  }
}
