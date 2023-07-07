import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { lesiure, work, travel, food }

final categoryIcon = {
  Category.food: Icons.fastfood,
  Category.work: Icons.work,
  Category.lesiure: Icons.movie,
  Category.travel: Icons.flight,
};

class Expanse {
  Expanse(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get getFormatedDate => formatter.format(date);
}

class ExpanseBuckets {
  ExpanseBuckets({required this.category, required this.expanses});

// alternative constructor

  ExpanseBuckets.forCategory(List<Expanse> allExpanses, this.category)
      : expanses = allExpanses
            .where((expanse) => expanse.category == category)
            .toList();

  final Category category;
  final List<Expanse> expanses;

  double get totalExpanse {
    double sum = 0;

    for (final expanse in expanses) {
      sum += expanse.amount;
    }
    return sum;
  }
}
