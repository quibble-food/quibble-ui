import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quibble/providers/cartitemsprovider.dart';
import 'package:quibble/views/restaurant/components/viewcartbar.dart';
import '../../../common.dart';
import '../../../models/food.dart';
import 'menu.dart';
import 'restaurantdetails.dart';

class RestaurantMenuItemsBody extends StatefulWidget {
  final String restaurant;
  final List<FoodItem> menuItemsFromSearch;
  RestaurantMenuItemsBody({
    super.key,
    this.menuItemsFromSearch = const [],
    required this.restaurant,
  });

  @override
  State<RestaurantMenuItemsBody> createState() =>
      _RestaurantMenuItemsBodyState();
}

class _RestaurantMenuItemsBodyState extends State<RestaurantMenuItemsBody> {
  @override
  Widget build(BuildContext context) {
    return Menu(
      restaurant: widget.restaurant,
      menuItemsFromSearch: widget.menuItemsFromSearch,
    );
  }
}
