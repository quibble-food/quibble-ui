import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quibble/models/food.dart';
import 'package:quibble/views/components/cards/fooditemcard.dart';

import '../../../providers/cartitemsprovider.dart';
import '../../../services/getfooditems.dart';
import '../../searchinrestaurant/searchinrestaurant.dart';

class Menu extends StatefulWidget {
  final String restaurant;
  final List<FoodItem> menuItemsFromSearch;
  const Menu({
    super.key,
    this.menuItemsFromSearch = const [],
    required this.restaurant,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<FoodItem>> _menu;
  List<FoodItem> _menuItems = [];
  List<CartItem> cart = [];
  double total = 0.0;
  late TextEditingController textController;

  Future<void> setMenuItems(Future<List<FoodItem>> menu) async {
    _menuItems = await menu;
  }

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '');
    if (widget.menuItemsFromSearch.isEmpty) {
      _menu = getMenu(widget.restaurant);
    } else {
      _menu = Future.value(widget.menuItemsFromSearch);
    }
    setMenuItems(_menu);
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: 0,
          child: Container(
            height: screenSize.height * 0.06,
            margin: EdgeInsets.fromLTRB(
                screenSize.width * 0.05,
                screenSize.height * 0.03,
                screenSize.width * 0.05,
                screenSize.width * 0.05),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(36))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CupertinoSearchTextField(
                backgroundColor: Colors.white,
                controller: textController,
                placeholder: 'Search for something tasty',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => SearchInRestaurantWidget(
                        restaurant: widget.restaurant,
                        menuItems: _menuItems,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: FutureBuilder<List<dynamic>>(
              future: _menu,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _menuItems.length,
                    itemBuilder: (context, index) {
                      final menuItem = _menuItems[index];
                      return FoodItemCard(
                        foodItemProps: menuItem,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ],
    );
  }
}
