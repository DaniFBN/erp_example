// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../domain/stores/add_ingredient_store.dart';
import '../../../domain/stores/ingredient_store.dart';
import 'layouts/add_ingredient_desktop_layout.dart';
import 'layouts/add_ingredient_mobile_layout.dart';
import 'layouts/add_ingredient_tablet_layout.dart';

class AddIngredientPage extends StatefulWidget {
  final ISnackBarService snackBarService;
  final AddIngredientStore addIngredientStore;
  final IngredientStore ingredientStore;

  const AddIngredientPage({
    super.key,
    required this.snackBarService,
    required this.addIngredientStore,
    required this.ingredientStore,
  });

  @override
  State<AddIngredientPage> createState() => _AddIngredientPageState();
}

class _AddIngredientPageState extends State<AddIngredientPage> {
  @override
  void initState() {
    super.initState();

    widget.addIngredientStore.observer(
      onState: (state) {
        if (widget.addIngredientStore.isSuccess) {
          widget.ingredientStore.getIngredientsByEnterprise(23);
          NavigatorService.instance.pop();
        }
      },
      onError: (error) {
        widget.snackBarService.showSnackBarByText(error.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DsLayoutResolver(
      mobile: AddIngredientMobileLayout(
        addIngredientStore: widget.addIngredientStore,
      ),
      tablet: const AddIngredientTabletLayout(),
      desktop: const AddIngredientDesktopLayout(),
    );
  }
}
