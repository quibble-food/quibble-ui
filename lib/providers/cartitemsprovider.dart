import 'package:flutter/foundation.dart';

import '../models/food.dart';

class CartItem {
  final FoodItem foodItem;
  int count;

  CartItem({required this.foodItem, required this.count});
}

class CartItemsProvider extends ChangeNotifier {
  final List<CartItem> _cart = [];
  double _total = 0.0;
  final int _cartItemCount = 0;

  int get cartItemCount => _cartItemCount;

  List<CartItem> get cart => _cart;

  double get total => _total;

  void addToCart(FoodItem item) {
    var itemToUpdate = _cart.firstWhere(
      (foodItems) => foodItems.foodItem == item,
      orElse: () => CartItem(foodItem: item, count: 0),
    );
    if (itemToUpdate.count == 0) _cart.add(itemToUpdate);
    itemToUpdate.count++;
    _total += itemToUpdate.foodItem.price;
    notifyListeners();
  }

  void removeFromCart(FoodItem item) {
    var itemToUpdate = _cart.firstWhere(
      (foodItems) => foodItems.foodItem == item,
      orElse: () => CartItem(foodItem: item, count: 0),
    );
    if (_cart.contains(itemToUpdate) && itemToUpdate.count == 1) {
      _cart.remove(itemToUpdate);
    } else {
      itemToUpdate.count--;
    }
    _total -= itemToUpdate.foodItem.price;
    notifyListeners();
  }
}
