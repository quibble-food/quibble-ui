import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:quibble/common.dart';
import 'package:quibble/providers/cartitemsprovider.dart';
import 'package:quibble/views/restaurant/components/body.dart';

import '../../models/food.dart';
import 'components/viewcartbar.dart';

class Restaurant extends StatefulWidget {
  final String restaurant;
  final List<FoodItem> menuItemsFromSearch;
  final Widget? searchKey;
  const Restaurant({
    super.key,
    this.searchKey,
    this.menuItemsFromSearch = const [],
    required this.restaurant,
  });

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItemsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        elevation: 0,
        leading: RestaurantBackButton(
          context: context,
        ),
        title: Expanded(
          child: Row(
            children: [
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.restaurant,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: RestaurantMenuItemsBody(
        restaurant: widget.restaurant,
        menuItemsFromSearch: widget.menuItemsFromSearch,
      ),
      bottomNavigationBar: cart.cart.isNotEmpty ? const ViewCartBar() : null,
    );
  }
}
