import 'package:flutter/material.dart';

enum ActionButtonVariant { primary, secondary }

class ActionButtonViewModel {
  final String text;
  final VoidCallback? onPressed;
  final ActionButtonVariant variant;
  final bool isLoading;
  final bool enabled;

  const ActionButtonViewModel({
    required this.text,
    required this.onPressed,
    this.variant = ActionButtonVariant.primary,
    this.isLoading = false,
    this.enabled = true,
  });
}
