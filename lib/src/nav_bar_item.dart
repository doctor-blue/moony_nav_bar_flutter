import 'package:flutter/material.dart';

import 'utils.dart';

class NavigationBarItem {
  final IconData icon;
  final NavigationButtonTapCallback onTap;
  const NavigationBarItem({required this.icon, required this.onTap});
}