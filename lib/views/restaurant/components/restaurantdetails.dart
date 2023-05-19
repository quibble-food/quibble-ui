import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: screen.height * 0.2,
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
                    Container(
                      height: screen.height * 0.06,
                      margin: EdgeInsets.fromLTRB(screen.width * 0.05,
                          screen.height * 0.02, screen.width * 0.05, 0),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(36))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CupertinoSearchTextField(
                          backgroundColor: Colors.white,
                          controller: textController,
                          placeholder: 'Search for something tasty',
                        ),
                      ),
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
