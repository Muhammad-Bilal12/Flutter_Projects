import 'package:flutter/material.dart';
import 'package:dice_roll_app/gradient_box.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      // body: GradientBox(colors: [Colors.deepOrange, Colors.orange]),
      body: GradientBox.purple(),
    ),
  ));
}
