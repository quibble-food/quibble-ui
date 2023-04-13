import 'package:flutter/material.dart';

class QuestionLine extends StatelessWidget {
  const QuestionLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text("What are you in mood for?",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const Spacer(),
        TextButton(
          style: const ButtonStyle(
              alignment: Alignment.center,
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 4, 133, 238))),
          child: const Text("See all", style: TextStyle(color: Colors.white)),
          onPressed: () {
            // Offer function call
          },
        )
      ],
    );
  }
}
