import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/food.dart';

List<FoodItem> returnresponse = [
  FoodItem(
    name: 'Cheeseburger',
    restaurant: "Food court",
    description:
        'A classic cheeseburger with a beef patty, cheese, lettuce, and tomato.',
    price: 40,
    veg: true,
    isCustomizable: false,
    imageUrl: "assets/images/networkimages/burger.jpg",
  ),
  FoodItem(
    name: 'Double Crispy chicken burger',
    restaurant: "Food court",
    description:
        'A fresh salad with romaine lettuce, croutons, and Parmesan cheese.',
    price: 40,
    veg: true,
    isCustomizable: true,
    imageUrl: "assets/images/networkimages/burger.jpg",
  ),
  FoodItem(
    name: 'Burger',
    restaurant: "Food court",
    description:
        'A fresh salad with romaine lettuce, croutons, and Parmesan cheese.',
    price: 40,
    veg: false,
    isCustomizable: true,
    imageUrl: "assets/images/networkimages/burger.jpg",
  ),
  FoodItem(
    name: 'Pasta',
    restaurant: "Food court",
    veg: true,
    description:
        'A fresh salad with romaine lettuce, croutons, and Parmesan cheese.',
    price: 40,
    isCustomizable: true,
    imageUrl: "assets/images/networkimages/pasta.jpg",
  ),
  FoodItem(
    name: 'Caesar Salad',
    restaurant: "Food court",
    description:
        'A fresh salad with romaine lettuce, croutons, and Parmesan cheese.',
    price: 40,
    veg: false,
    isCustomizable: false,
    imageUrl: "assets/images/networkimages/coffee.jpg",
  ),
  // add more menu items here
];

Future<List<FoodItem>> getTrending() async {
  return returnresponse;
  // final response =
  //     await http.get(Uri.parse("https://quibble.com/api/v1/Trending"));
  // if (response.statusCode == 200) {
  //   final List<dynamic> data = json.decode(response.body);
  //   return data
  //       .map((json) => FoodItem(
  //             name: json['name'],
  //             restaurant: json['restaurant'],
  //             description: json['description'],
  //             price: json['price'].toDouble(),
  //             imageUrl: json['imageUrl'],
  //           ))
  //       .toList();
  // } else {
  //   throw Exception('Failed to fetch menu items');
  // }
}

Future<List<FoodItem>> getMenu(String restaurant) async {
  // final response = await http.get(
  //     Uri.parse("https://quibble.com/api/v1/menu?restaurant=$restaurant"));
  // if (response.statusCode == 200) {
  // final List<dynamic> data = json.decode(response.body);
  return returnresponse;
  // return data
  //     .map((json) => FoodItem(
  //           name: json['name'],
  //           restaurant: json['restaurant'],
  //           description: json['description'],
  //           price: json['price'].toDouble(),
  //           imageUrl: json['imageUrl'],
  //         ))
  //     .toList();
  // } else {
  //   throw Exception('Failed to fetch menu items');
  // }
}
