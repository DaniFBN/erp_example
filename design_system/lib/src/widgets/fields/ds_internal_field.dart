// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:l10n/l10n.dart';

import 'ds_default_field.dart';

typedef FieldValidator = String? Function(String? value);

class DsInternalField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final FieldValidator? validator;
  final int? maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final bool isRequired;

  const DsInternalField({
    super.key,
    required this.controller,
    required this.label,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.validator,
    this.maxLines = 1,
    this.keyboardType,
    this.inputFormatters,
    this.autofillHints,
    this.isRequired = true,
  });

  String? requiredValidator(String? value, {required String emptyMessage}) {
    if (value == null || value.isEmpty) {
      return emptyMessage;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    return DsDefaultField(
      label: label,
      field: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: (value) {
          if (isRequired) {
            return requiredValidator(
              value,
              emptyMessage: translate.requiredField,
            );
          }

          return validator?.call(value);
        },
        keyboardType: keyboardType,
        autofillHints: autofillHints,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
