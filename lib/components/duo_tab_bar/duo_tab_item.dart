import 'package:flutter/material.dart';

class DuoTabItem {
  final IconData icon;
  final String label;
  final int? badgeCount;

  const DuoTabItem({required this.icon, required this.label, this.badgeCount});
}
