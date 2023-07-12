import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quibble/models/food.dart';
import 'package:quibble/views/searchinrestaurant/components/body.dart';

import '../../common.dart';
import '../restaurant/restaurant.dart';

class SearchInRestaurantWidget extends StatefulWidget {
  final String restaurant;
  final List<FoodItem> menuItems;

  const SearchInRestaurantWidget(
      {super.key, required this.restaurant, required this.menuItems});

  @override
  State<SearchInRestaurantWidget> createState() =>
      _SearchInRestaurantWidgetState();
}

class _SearchInRestaurantWidgetState extends State<SearchInRestaurantWidget> {
  final textController = TextEditingController();
  var items = <FoodItem>[];
  var showResults = false;
  var queryString = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  void searchResults(String queryString) {
    if (queryString != '') {
      setState(() {
        items = widget.menuItems
            .where((item) =>
                item.name.toLowerCase().contains(queryString.toLowerCase()))
            .toList();
        showResults = true;
        // super.initState();
      });
    } else {
      setState(() {
        items = [];
        this.queryString = queryString;
        showResults = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0.0,
            elevation: 0,
            leading: RestaurantBackButton(
              context: context,
            ),
            backgroundColor: Colors.white,
            title: CupertinoSearchTextField(
                backgroundColor: Colors.white,
                controller: textController,
                keyboardType: TextInputType.text,
                placeholder: 'Search for something tasty',
                onChanged: (value) {
                  searchResults(value);
                })),
        body: showResults
            ? SearchBody(
                restaurant: widget.restaurant,
                menuItems: items,
              )
            : const SizedBox());
  }
}
