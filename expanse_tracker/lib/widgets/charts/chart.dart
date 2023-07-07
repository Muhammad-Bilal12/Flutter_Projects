import 'package:expanse_tracker/widgets/charts/chart_bar.dart';
import 'package:flutter/material.dart';

import 'package:expanse_tracker/models/expanse.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expanse> expenses;

  List<ExpanseBuckets> get buckets {
    return [
      ExpanseBuckets.forCategory(expenses, Category.food),
      ExpanseBuckets.forCategory(expenses, Category.lesiure),
      ExpanseBuckets.forCategory(expenses, Category.travel),
      ExpanseBuckets.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpanse > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpanse;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // ...buckets.map((bucket) {
                //   return ChartBar(
                //     fill: bucket.totalExpanse == 0
                //         ? 0
                //         : bucket.totalExpanse / maxTotalExpense,
                //   );
                // }),
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalExpanse == 0
                        ? 0
                        : bucket.totalExpanse / maxTotalExpense,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcon[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
