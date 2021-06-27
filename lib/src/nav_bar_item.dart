import 'package:flutter/material.dart';

import 'utils.dart';

class NavigationBarItem {
  final IconData icon;
  final NavigationButtonTapCallback onTap;
  final IconData? activeIcon;
  final Color? color;
  final Color? indicatorColor;
  
  const NavigationBarItem(
      {required this.icon,
      required this.onTap,
      this.activeIcon,
      this.color,
      this.indicatorColor});
}
