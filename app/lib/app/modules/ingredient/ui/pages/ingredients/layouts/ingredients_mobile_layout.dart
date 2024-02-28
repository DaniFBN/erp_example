import 'package:flutter/material.dart';

import '../../../../domain/stores/ingredient_store.dart';

class IngredientsMobileLayout extends StatelessWidget {
  final IngredientStore ingredientStore;

  const IngredientsMobileLayout({
    super.key,
    required this.ingredientStore,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
