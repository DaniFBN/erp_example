import 'package:flutter/material.dart';

import '../../../design_system.dart';

typedef FieldValidator = String? Function(String? value);

class DsDefaultField extends StatelessWidget {
  final String label;
  final Widget field;

  const DsDefaultField({
    super.key,
    required this.label,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: Responsive.size(4)),
        field,
      ],
    );
  }
}
