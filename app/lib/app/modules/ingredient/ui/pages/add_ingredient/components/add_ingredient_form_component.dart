import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';

import '../../../../../../core/shared/enums/unit_measurement_enum.dart';
import '../../../../domain/helpers/params/add_ingredient_param.dart';
import '../../../../domain/stores/add_ingredient_store.dart';

class AddIngredientFormComponent extends StatefulWidget {
  final AddIngredientStore store;

  const AddIngredientFormComponent({
    super.key,
    required this.store,
  });

  @override
  State<AddIngredientFormComponent> createState() =>
      _AddIngredientFormComponentState();
}

class _AddIngredientFormComponentState
    extends State<AddIngredientFormComponent> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final amountController = TextEditingController();
  int? selectedUnitMeasurement = 0;

  void change(int? newA) {
    setState(() {
      selectedUnitMeasurement = newA;
    });
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    return Form(
      key: formKey,
      child: Column(
        children: [
          DsTextField(
            label: translate.name,
            controller: nameController,
          ),
          const SizedBox(height: 32),
          DsTextField(
            label: translate.description,
            controller: descriptionController,
          ),
          const SizedBox(height: 32),
          DsTextField(
            label: translate.price,
            controller: priceController,
          ),
          const SizedBox(height: 32),
          DsTextField(
            label: translate.amount,
            controller: amountController,
          ),
          const SizedBox(height: 32),
          DsDropdownField(
            label: translate.unitMeasurement,
            value: 0,
            onChanged: change,
            items: UnitMeasurement.values.map((unitMeasurement) {
              return DropdownMenuItem(
                value: unitMeasurement.code,
                child: Text(unitMeasurement.descriptive),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              widget.store.add(
                AddIngredientParam(
                  enterpriseID: 23,
                  name: nameController.text,
                  description: descriptionController.text,
                  price: double.parse(priceController.text),
                  amount: double.parse(amountController.text),
                  unitMeasurement:
                      UnitMeasurement.fromCode(selectedUnitMeasurement ?? 0),
                ),
              );
            },
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}
