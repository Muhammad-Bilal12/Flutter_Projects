import 'package:expanse_tracker/widgets/charts/chart.dart';
import 'package:expanse_tracker/widgets/expanse_list/expanse_list.dart';
import 'package:expanse_tracker/widgets/new_expanse.dart';
import 'package:flutter/material.dart';

import 'models/expanse.dart';

class Expaneses extends StatefulWidget {
  const Expaneses({super.key});

  @override
  State<Expaneses> createState() => _ExpanesesState();
}

class _ExpanesesState extends State<Expaneses> {
  final List<Expanse> _registeredExpanse = [];
  // final List<Expanse> _registeredExpanse = [
  //   Expanse(
  //     title: "oil spent",
  //     amount: 150,
  //     date: DateTime.now(),
  //     category: Category.work,
  //   ),
  //   Expanse(
  //     title: "Pakistan Tour",
  //     amount: 250000,
  //     date: DateTime.now(),
  //     category: Category.travel,
  //   ),
  // ];

  void _openAddExpanseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpanse(onAddExpanse: _addExpanseData),
    );
  }

  void _addExpanseData(Expanse expanses) {
    setState(() {
      _registeredExpanse.add(expanses);
    });
  }

  void _removeExpanseData(Expanse expanses) {
    final expanseIndex = _registeredExpanse.indexOf(expanses);
    setState(() {
      _registeredExpanse.remove(expanses);
    });
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // to remove the first one snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(8),
        content: const Text('Expanse Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpanse.insert(expanseIndex,
                    expanses); // allow to add number in a specific index
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpanse.isNotEmpty) {
      mainContent = ExpanseList(
        expanses: _registeredExpanse,
        onRemoveExpanse: _removeExpanseData,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpanseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpanseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpanse),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
