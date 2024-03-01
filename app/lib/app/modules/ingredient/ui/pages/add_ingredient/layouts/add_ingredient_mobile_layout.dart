import 'package:flutter/material.dart';

import '../../../../domain/stores/add_ingredient_store.dart';
import '../components/add_ingredient_form_component.dart';

class AddIngredientMobileLayout extends StatelessWidget {
  final AddIngredientStore addIngredientStore;

  const AddIngredientMobileLayout({
    super.key,
    required this.addIngredientStore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AddIngredientFormComponent(
          store: addIngredientStore,
        ),
      ),
    );
  }
}
