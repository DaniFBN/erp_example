// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../design_system.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: Responsive.size(4)),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          keyboardType: keyboardType,
          autofillHints: autofillHints,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(Responsive.size(8)),
              ),
            ),
            filled: true,
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
