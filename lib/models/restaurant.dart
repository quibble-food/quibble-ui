class Restaurant {
  final String name;

  Restaurant({
    required this.name,
  });
}

class RestaurantRating {
  final double rating;
  final int count;

  RestaurantRating({required this.rating, required this.count});

  factory RestaurantRating.fromJson(Map<String, dynamic> json) {
    return RestaurantRating(rating: json['rating'], count: json['count']);
  }
}
