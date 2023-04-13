import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../services/getrestaurantdata.dart';

class RestaurantDetails extends StatefulWidget {
  final String restaurant;
  const RestaurantDetails({super.key, required this.restaurant});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  late Future<dynamic> _details;
  final _restaurantAPI = RestaurantApi();

  @override
  void initState() {
    super.initState();
    // _details = _restaurantAPI.getRestaurantDetails(widget.restaurant);
  }

  @override
  Widget build(BuildContext context) {
    // ScrollController controller = ScrollController();
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.92,
      height: screenSize.height * 0.22,
      margin: const EdgeInsets.only(left: 1, right: 1, top: 2, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize.width * 0.05),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              widget.restaurant,
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Colors.grey.withOpacity(0.5),
                decorationThickness: 1.0,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(CupertinoIcons.share),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
        const SizedBox(height: 5.0),
        Row(
          children: [Icon(Icons.star), Text("3.5 (158 ratings)")],
        ),
        const SizedBox(height: 16.0),
        Text(
          'blah blah blah blah blah',
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 16.0,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid,
            decorationColor: Colors.grey.withOpacity(0.5),
            decorationThickness: 1.0,
          ),
        ),
        const SizedBox(height: 16.0),
        const Text(
          'X% Off!',
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ]),
    );
  }
}
