// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ds_internal_field.dart';

class DsTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget? prefix;
  final Widget? suffix;
  final FieldValidator? validator;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;

  const DsTextField({
    super.key,
    required this.controller,
    required this.label,
    this.prefix,
    this.suffix,
    this.validator,
    this.maxLines,
    this.keyboardType,
    this.autofillHints,
    this.inputFormatters,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return DsInternalField(
      controller: controller,
      validator: validator,
      label: label,
      prefix: prefix,
      suffix: suffix,
      keyboardType: keyboardType,
      maxLines: maxLines,
      autofillHints: autofillHints,
      inputFormatters: inputFormatters,
    );
  }
}
