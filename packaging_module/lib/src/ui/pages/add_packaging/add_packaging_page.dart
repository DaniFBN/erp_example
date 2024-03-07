import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../stores/add_packaging_store.dart';
import '../../stores/packaging_store.dart';
import 'layouts/add_packaging_desktop_layout.dart';
import 'layouts/add_packaging_mobile_layout.dart';
import 'layouts/add_packaging_tablet_layout.dart';

class AddPackagingPage extends StatefulWidget {
  final ISnackBarService snackBarService;
  final AddPackagingStore addPackagingStore;
  final PackagingStore packagingStore;

  const AddPackagingPage({
    super.key,
    required this.snackBarService,
    required this.addPackagingStore,
    required this.packagingStore,
  });

  @override
  State<AddPackagingPage> createState() => _AddPackagingPageState();
}

class _AddPackagingPageState extends State<AddPackagingPage> {
  @override
  void initState() {
    super.initState();

    widget.addPackagingStore.observer(
      onState: (state) {
        if (widget.addPackagingStore.isSuccess) {
          widget.packagingStore.getPackagingByEnterprise(23);
          NavigatorService.instance.pop();
        }
      },
      onError: (error) {
        widget.snackBarService.showSnackBarByText(error.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DsLayoutResolver(
      mobile: AddPackagingMobileLayout(
        addPackagingStore: widget.addPackagingStore,
      ),
      tablet: const AddPackagingTabletLayout(),
      desktop: const AddPackagingDesktopLayout(),
    );
  }
}
