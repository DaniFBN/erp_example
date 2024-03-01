// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'ds_default_field.dart';

typedef FieldValidator = String? Function(String? value);

class DsInternalField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final FieldValidator? validator;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;

  const DsInternalField({
    super.key,
    required this.controller,
    required this.label,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return DsDefaultField(
      label: label,
      field: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        keyboardType: keyboardType,
        autofillHints: autofillHints,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
