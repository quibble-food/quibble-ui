import 'package:flutter/material.dart';
import 'package:quibble/constants.dart';

import '../../../models/food.dart';

class SearchInRestaurant extends StatefulWidget {
  final List<FoodItem> menuItems;
  const SearchInRestaurant({super.key, required this.menuItems});

  @override
  State<SearchInRestaurant> createState() => _SearchInRestaurantState();
}

class _SearchInRestaurantState extends State<SearchInRestaurant> {
  TextEditingController editingController = TextEditingController();
  var items = <FoodItem>[];

  @override
  void initState() {
    items = widget.menuItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              items[index].name,
            ),
          );
        },
      ),
    );
  }
}
