import 'package:flutter/material.dart';

class ButtonsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ElevatedButton(onPressed: () {}, child: Text("Hello"))],
    );
  }
}
