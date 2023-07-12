import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedRoute extends PageRouteBuilder {
  final Widget widget;

  AnimatedRoute(this.widget)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

class RestaurantBackButton extends StatelessWidget {
  final BuildContext context;
  const RestaurantBackButton({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 10),
      color: Colors.white,
      height: screen.height * 0.05,
      width: screen.height * 0.05,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          weight: 4,
          color: Colors.purple.shade400,
        ),
        onPressed: () {
          // Handle back button press
          Navigator.pop(this.context);
        },
      ),
    );
  }
}

class QuibleSearchBar extends StatelessWidget {
  TextEditingController textController;
  Function onTapFunction = () {};
  Function onChangeFunction = () {};
  QuibleSearchBar(
    this.onTapFunction,
    this.onChangeFunction, {
    super.key,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      backgroundColor: Colors.white,
      controller: textController,
      placeholder: 'Search for something tasty',
      onTap: onTapFunction(),
    );
  }
}
