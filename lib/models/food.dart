import 'package:quibble/views/homepage/components/cuisines.dart';

class FoodItem {
  final String name;
  final String restaurant;
  final String imageUrl;
  final String description;
  final int price;

  FoodItem({
    required this.name,
    required this.restaurant,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}
