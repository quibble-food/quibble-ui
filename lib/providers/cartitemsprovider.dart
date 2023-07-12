import 'package:flutter/foundation.dart';

import '../models/food.dart';

class CartItemsProvider extends ChangeNotifier {
  double _total = 0.0;
  List<FoodItem> _cart = [];
  int _cartItemCount = 0;

  int get cartItemCount => _cartItemCount;

  List<FoodItem> get cart => _cart;

  double get total => _total;

  void addToCart(FoodItem item) {
    _cart.add(item);
    _cartItemCount++;
    _total += item.price;
    print(_total);
    notifyListeners();
  }

  void removeFromCart(FoodItem item) {
    _cart.remove(item);
    _total -= item.price;
    _cartItemCount--;
    print(_total);
    notifyListeners();
  }
}
