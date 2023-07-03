import 'package:dice_roll_app/dice_roller.dart';
import "package:flutter/material.dart";
import 'package:dice_roll_app/style_text.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({required this.colors, super.key});

// Multi Constructor
  GradientBox.purple({super.key}) : colors = [Colors.deepPurple, Colors.purple];

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
