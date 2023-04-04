import 'dart:convert';
import 'package:http/http.dart' as http;

class RestaurantApi {
  Future<Map<String, dynamic>> getRestaurantDetails() async {
    final response =
        await http.get(Uri.parse('https://quibble.in/getRestaurantDetails'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load restaurant details');
    }
  }
}
