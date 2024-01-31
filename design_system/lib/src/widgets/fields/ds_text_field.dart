import 'package:flutter/material.dart';

import 'ds_internal_field.dart';

class DsTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget? prefix;
  final Widget? suffix;
  final FieldValidator? validator;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;

  const DsTextField({
    super.key,
    required this.controller,
    required this.label,
    this.prefix,
    this.suffix,
    this.validator,
    this.keyboardType,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return DsInternalField(
      controller: controller,
      validator: validator,
      label: label,
      prefix: prefix,
      suffix: suffix,
      autofillHints: autofillHints,
    );
  }
}
