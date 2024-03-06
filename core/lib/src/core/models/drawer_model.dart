import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';

class DrawerModel {
  final String Function(AppLocalizations translate) name;
  final String url;
  final IconData icon;

  const DrawerModel({
    required this.name,
    required this.url,
    required this.icon,
  });
}

final drawerItems = [
  DrawerModel(
    name: (translate) => translate.home,
    url: '/home/',
    icon: Icons.home_outlined,
  ),
  DrawerModel(
    name: (translate) => translate.ingredients,
    url: '/ingredients/',
    icon: Icons.store_mall_directory_outlined,
  ),
];
