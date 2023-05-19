class FoodItem {
  final String name;
  final String restaurant;
  final String imageUrl;
  final String description;
  Object? offers;
  List<Object>? addons;
  final int price;
  final bool veg;
  int? count = 0;

  FoodItem(
      {required this.name,
      required this.restaurant,
      required this.imageUrl,
      required this.description,
      required this.price,
      required this.veg});
}
