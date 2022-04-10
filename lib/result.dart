import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "You did it!",
        style: TextStyle(
          fontSize: 40,
          color: Colors.brown,
        ),
      ),
    );
  }
}
