import 'package:flutter/material.dart';

import 'ds_default_field.dart';

class DsDropdownField<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final String? Function(T? value)? validator;
  final void Function(T? value) onChanged;

  const DsDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DsDefaultField(
      label: label,
      field: DropdownButtonFormField<T>(
        items: items,
        value: value,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
