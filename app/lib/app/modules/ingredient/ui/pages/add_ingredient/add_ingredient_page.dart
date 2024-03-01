// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../domain/stores/add_ingredient_store.dart';
import 'layouts/add_ingredient_desktop_layout.dart';
import 'layouts/add_ingredient_mobile_layout.dart';
import 'layouts/add_ingredient_tablet_layout.dart';

class AddIngredientPage extends StatefulWidget {
  final AddIngredientStore addIngredientStore;

  const AddIngredientPage({
    super.key,
    required this.addIngredientStore,
  });

  @override
  State<AddIngredientPage> createState() => _AddIngredientPageState();
}

class _AddIngredientPageState extends State<AddIngredientPage> {
  @override
  void initState() {
    super.initState();
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
