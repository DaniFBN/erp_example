// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:global_dependencies/global_dependencies.dart';

import '../../../../domain/entities/ingredient_entity.dart';
import '../../../../domain/stores/ingredient_store.dart';
import '../graph.dart';
import '../ingredient_card.dart';

class IngredientsDesktopLayout extends StatelessWidget {
  final IngredientStore ingredientStore;
  const IngredientsDesktopLayout({
    super.key,
    required this.ingredientStore,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Graph(
        gap: 32,
        height: size.height * 0.8,
        width: size.height * 0.8,
        internalPaintGap: 16,
        verticalItems: List.generate(
          10,
          (index) => (index * 50).toString(),
        ),
        horizontalItems: List.generate(
          10,
          (index) => HorizontalItem(
            percentage: Random().nextDouble(),
            label: 'Item $index',
          ),
        ),
      ),
    );

    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.red,
            width: 300,
            height: size.height,
          ),
          Expanded(
            child: ScopedBuilder(
              store: ingredientStore,
              onLoading: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              onState: (_, List<IngredientEntity> state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      const itemsInRow = 3;
                      const spacing = (itemsInRow - 1) * 8;
                      final availableWidth = constraints.maxWidth - spacing;
                      final itemWidth = availableWidth / 3;

                      return Wrap(
                        spacing: 8,
                        runSpacing: 16,
                        children: state.map((ingredient) {
                          return IngredientCard(
                            ingredient: ingredient,
                            width: itemWidth,
                          );
                        }).toList(),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
