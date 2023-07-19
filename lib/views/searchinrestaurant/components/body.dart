import 'package:flutter/material.dart';
import 'package:quibble/models/food.dart';
import 'search.dart';

class SearchBody extends StatefulWidget {
  final String restaurant;
  final List<FoodItem> menuItems;
  const SearchBody(
      {super.key, required this.restaurant, required this.menuItems});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  String queryString = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SearchInRestaurant(
        menuItems: widget.menuItems,
      ),
    );
  }
}
