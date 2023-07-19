import 'package:flutter/material.dart';

import '../../../models/restaurant.dart';

import '../../../constants.dart';
import '../../../services/getrestaurantdata.dart';

class RestaurantDetails extends StatefulWidget {
  final String restaurant;
  const RestaurantDetails({super.key, required this.restaurant});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  late Future<RestaurantRating> rating;
  late TextEditingController textController;
  final _ratingAPI = RestaurantApi();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '');
    rating = _ratingAPI.getRestaurantRating(widget.restaurant);
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: screen.height * 0.1,
          child: Stack(
            children: [
              Container(
                height: screen.height * 0.2 - 27,
                decoration: BoxDecoration(
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 50,
                          color: Colors.grey.shade400)
                    ],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36))),
              ),
              Positioned(
                child: Column(
                  children: [
                    FutureBuilder<RestaurantRating>(
                      future: rating,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                              padding: EdgeInsets.only(
                                  left: screen.width * 0.05,
                                  right: screen.width * 0.05),
                              child: Row(
                                children: [
                                  const Icon(Icons.star_border_outlined,
                                      size: 40,
                                      color: Color.fromARGB(255, 9, 224, 16)),
                                  snapshot.data!.count < 100
                                      ? Text(
                                          '${snapshot.data!.rating} ratings',
                                          style: const TextStyle(
                                              fontSize: 28,
                                              color: Colors.white),
                                        )
                                      : Text(
                                          '${(snapshot.data!.rating / 100) * 100}+ ratings',
                                          style: const TextStyle(
                                              fontSize: 28,
                                              color: Colors.white)),
                                ],
                              ));
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
