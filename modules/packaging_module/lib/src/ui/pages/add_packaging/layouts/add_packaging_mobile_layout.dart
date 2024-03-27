import 'package:flutter/material.dart';

import '../../../stores/add_packaging_store.dart';
import '../components/add_packaging_form_component.dart';

class AddPackagingMobileLayout extends StatelessWidget {
  final AddPackagingStore addPackagingStore;

  const AddPackagingMobileLayout({
    super.key,
    required this.addPackagingStore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AddPackagingFormComponent(
          store: addPackagingStore,
        ),
      ),
    );
  }
}
