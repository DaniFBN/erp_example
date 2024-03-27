import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_dependencies/global_dependencies.dart';
import 'package:l10n/l10n.dart';

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
  int selectedUnitMeasurement = 0;

  void change(int? newValue) {
    if (newValue == null || newValue == selectedUnitMeasurement) return;

    setState(() {
      selectedUnitMeasurement = newValue;
    });
  }

  void submitForm() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    widget.store.add(
      AddIngredientParam(
        enterpriseID: 1,
        name: nameController.text,
        description: descriptionController.text,
        price: PriceFormatter.clearMask(priceController.text),
        amount: double.parse(amountController.text),
        unitMeasurement: UnitMeasurement.fromCode(selectedUnitMeasurement),
      ),
    );
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
            maxLines: 3,
          ),
          const SizedBox(height: 32),
          DsTextField(
            label: translate.price,
            controller: priceController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              PriceFormatter(moeda: true),
            ],
          ),
          const SizedBox(height: 32),
          DsTextField(
            label: translate.amount,
            controller: amountController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 32),
          DsDropdownField(
            label: translate.unitMeasurement,
            value: selectedUnitMeasurement,
            onChanged: change,
            items: UnitMeasurement.values.map((unitMeasurement) {
              return DropdownMenuItem(
                value: unitMeasurement.code,
                child: Text(unitMeasurement.descriptive),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          TripleBuilder(
            store: widget.store,
            builder: (_, store) {
              if (widget.store.isLoading) {
                return const CircularProgressIndicator();
              }
              return ElevatedButton(
                onPressed: submitForm,
                child: const Text('Adicionar'),
              );
            },
          ),
        ],
      ),
    );
  }
}
