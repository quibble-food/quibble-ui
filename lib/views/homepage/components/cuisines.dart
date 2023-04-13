
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final List foodItems;
  final int index;
  const Description({super.key, required this.foodItems, required this.index});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 1),
        width: 60,
        height: 55,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(0, 1))
          ],
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/${widget.foodItems[widget.index]['image_url']}"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.center),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              widget.foodItems[widget.index]['name'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Cuisine extends StatefulWidget {
  const Cuisine({super.key});

  @override
  State<Cuisine> createState() => _CuisineState();
}

class _CuisineState extends State<Cuisine> {
  List foodItems = [
    {"name": "Noodles", "image_url": "pasta.png"},
    {"name": "Ice Cream", "image_url": "icecream.png"},
    {"name": "Burger", "image_url": "burger.png"},
    {"name": "Rolls", "image_url": "rolls.png"},
    {"name": "Biryani", "image_url": "biryani.png"},
    {"name": "Rolls", "image_url": "rolls.png"},
    {"name": "Biryani", "image_url": "biryani.png"},
    {"name": "Noodles", "image_url": "noodles.png"},
    {"name": "Noodles", "image_url": "noodles.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: foodItems.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () => {},
            child: Description(foodItems: foodItems, index: index));
      },
    );
  }
}
