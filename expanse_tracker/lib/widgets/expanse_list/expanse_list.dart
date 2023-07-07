import 'package:expanse_tracker/widgets/expanse_list/expanse_items.dart';
import "package:flutter/material.dart";
import 'package:expanse_tracker/models/expanse.dart';

class ExpanseList extends StatelessWidget {
  const ExpanseList(
      {super.key, required this.expanses, required this.onRemoveExpanse});

  final List<Expanse> expanses;
  final void Function(Expanse expanse) onRemoveExpanse;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expanses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        onDismissed: (direction) {
          onRemoveExpanse(expanses[index]);
        },
        key: ValueKey(expanses[index]),
        child: ExpanseItems(
          expanses[index],
        ),
      ),
    );
  }
}
