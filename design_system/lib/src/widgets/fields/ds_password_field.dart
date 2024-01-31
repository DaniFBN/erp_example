import 'package:flutter/material.dart';

import 'ds_internal_field.dart';

class DsPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Widget? prefix;
  final FieldValidator? validator;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;

  const DsPasswordField({
    super.key,
    required this.controller,
    required this.label,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.autofillHints,
  });

  @override
  State<DsPasswordField> createState() => _DsPasswordFieldState();
}

class _DsPasswordFieldState extends State<DsPasswordField> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DsInternalField(
      controller: widget.controller,
      label: widget.label,
      prefix: widget.prefix,
      obscureText: obscureText,
      validator: widget.validator,
      autofillHints: widget.autofillHints,
      suffix: InkWell(
        onTap: toggle,
        child: Icon(
          obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
      ),
    );
  }
}
