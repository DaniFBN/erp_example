import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/ingredient_entity.dart';

class IngredientCard extends StatelessWidget {
  final IngredientEntity ingredient;
  final double width;

  const IngredientCard({
    super.key,
    required this.ingredient,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ingredient.name.capitalize(),
              style: theme.textTheme.titleMedium,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    ingredient.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(width: 20),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: r'R$',
                        style: theme.textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: ingredient.price.toStringAsFixed(2),
                        style: theme.textTheme.bodyLarge,
                      ),
                      TextSpan(
                        text:
                            '/${ingredient.amount}${ingredient.unitMeasurement.toShow()}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
