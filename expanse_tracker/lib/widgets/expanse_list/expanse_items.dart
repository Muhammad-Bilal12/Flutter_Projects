import 'package:flutter/material.dart';

import '../../models/expanse.dart';

class ExpanseItems extends StatelessWidget {
  const ExpanseItems(this.expanse, {super.key});

  final Expanse expanse;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expanse.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '\$${expanse.amount.toStringAsFixed(2)}',
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[expanse.category]),
                    const SizedBox(width: 20),
                    Text(
                      expanse.getFormatedDate,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
