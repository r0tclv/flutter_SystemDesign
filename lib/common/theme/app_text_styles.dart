import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: AppColors.dark,
  );

  static const heading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.dark,
  );

  static const body = TextStyle(
    fontSize: 16,
    height: 1.4,
    color: AppColors.dark,
  );

  static const button = TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
}
