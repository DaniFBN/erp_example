import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';

import 'ds_default_field.dart';

class DsDropdownField<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final String? Function(T? value)? validator;
  final void Function(T? value) onChanged;
  final bool isRequired;

  const DsDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    this.validator,
    required this.onChanged,
    this.isRequired = true,
  });

  String? requiredValidator(T? value, {required String emptyMessage}) {
    if (value == null) {
      return emptyMessage;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    return DsDefaultField(
      label: label,
      field: DropdownButtonFormField<T>(
        items: items,
        value: value,
        onChanged: onChanged,
        validator: (value) {
          if (isRequired) {
            return requiredValidator(
              value,
              emptyMessage: translate.requiredField,
            );
          }

          return validator?.call(value);
        },
      ),
    );
  }
}
