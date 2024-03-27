import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../stores/packaging_store.dart';
import 'layouts/packagings_desktop_layout.dart';
import 'layouts/packagings_mobile_layout.dart';
import 'layouts/packagings_tablet_layout.dart';

class PackagingsPage extends StatefulWidget {
  final PackagingStore packagingStore;
  final ThemeStore themeStore;

  const PackagingsPage({
    super.key,
    required this.packagingStore,
    required this.themeStore,
  });

  @override
  State<PackagingsPage> createState() => _PackagingsPageState();
}

class _PackagingsPageState extends State<PackagingsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.packagingStore.getPackagingByEnterprise(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DsLayoutResolver(
      mobile: PackagingsMobileLayout(
        packagingStore: widget.packagingStore,
        themeStore: widget.themeStore,
      ),
      tablet: const PackagingsTabletLayout(),
      desktop: const PackagingsDesktopLayout(),
    );
  }
}
