import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:global_dependencies/global_dependencies.dart';
import 'package:l10n/l10n.dart';

import '../../../../domain/entities/ingredient_entity.dart';
import '../../../../domain/stores/ingredient_store.dart';
import '../ingredient_card.dart';

class IngredientsMobileLayout extends StatelessWidget {
  final IngredientStore ingredientStore;
  final ThemeStore themeStore;

  const IngredientsMobileLayout({
    super.key,
    required this.ingredientStore,
    required this.themeStore,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final translate = AppLocalizations.of(context);

    return MobileTemplateComponent(
      themeStore: themeStore,
      title: translate.ingredients,
      body: ScopedBuilder(
        store: ingredientStore,
        onLoading: (_) => const Center(child: CircularProgressIndicator()),
        onState: (_, List<IngredientEntity> state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: ListView.separated(
                itemCount: state.length,
                shrinkWrap: true,
                separatorBuilder: (_, __) => const SizedBox(height: 4),
                itemBuilder: (_, index) {
                  final ingredient = state.elementAt(index);

                  return IngredientCard(
                    ingredient: ingredient,
                    width: size.width * 0.8,
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigatorService.instance.push('/ingredients/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
