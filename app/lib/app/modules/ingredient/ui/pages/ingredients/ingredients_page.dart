import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../domain/stores/ingredient_store.dart';
import 'layouts/ingredients_desktop_layout.dart';
import 'layouts/ingredients_mobile_layout.dart';
import 'layouts/ingredients_tablet_layout.dart';

class IngredientsPage extends StatefulWidget {
  final IngredientStore ingredientStore;

  const IngredientsPage({
    super.key,
    required this.ingredientStore,
  });

  @override
  State<IngredientsPage> createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.ingredientStore.getIngredientsByEnterprise(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DsLayoutResolver(
      mobile: IngredientsMobileLayout(
        ingredientStore: widget.ingredientStore,
      ),
      tablet: const IngredientsTabletLayout(),
      desktop: const IngredientsDesktopLayout(),
    );
  }
}
