import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/restaurant.dart';

class RestaurantApi {
  Future<Restaurant> getRestaurantDetails(String restaurant) async {
    final response = await http.get(Uri.parse(
        'https://quibble.in/getRestaurantDetails?restaurant=$restaurant'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load restaurant details');
    }
  }
}
