import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/food.dart';
import '../../restaurant/restaurant.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  List<FoodItem> _foodItems = [];

  @override
  void initState() {
    super.initState();
    _fetchFoodItems();
  }

  List dummyFetch() {
    List response = [
      {
        "name": "Burger",
        "restaurant": "Food court",
        "image_url": "assets/images/networkimages/burger.jpg",
        "description": "description",
        "price": 45
      },
      {
        "name": "Mini canteen - coffee",
        "restaurant": "Food court",
        "image_url": "assets/images/networkimages/coffee.jpg",
        "description": "description",
        "price": 45
      },
      {
        "name": "Food court - Pasta",
        "restaurant": "Food court",
        "image_url": "assets/images/networkimages/pasta.jpg",
        "description": "description",
        "price": 45
      }
    ];
    return response;
  }

  Future<void> _fetchFoodItems() async {
    List json_response = dummyFetch();
    List<FoodItem> foodItems = [];
    for (var item in json_response) {
      foodItems.add(FoodItem(
          name: item['name'],
          restaurant: item['restaurant'],
          imageUrl: item['image_url'],
          description: item['description'],
          price: item['price']));
    }
    setState(() {
      _foodItems = foodItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();
    final screenSize = MediaQuery.of(context).size;
    return ListView.builder(
        controller: _controller,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _foodItems.length,
        itemBuilder: (BuildContext context, int index) {
          final foodItem = _foodItems[index];
          return Container(
              width: screenSize.width * 0.82,
              height: screenSize.height * 0.22,
              margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(foodItem.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Menu(
                      restaurant: foodItem.restaurant,
                    );
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodItem.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: '₹',
                              style: TextStyle(
                                color: Color.fromARGB(255, 3, 244, 11),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            TextSpan(
                              text: "${foodItem.price}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
