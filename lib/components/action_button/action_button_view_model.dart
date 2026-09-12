import 'package:flutter/material.dart';

enum ActionButtonVariant { primary, secondary, danger }

enum ActionButtonSize { small, medium, large }

class ActionButtonViewModel {
  final String text;
  final VoidCallback? onPressed;
  final ActionButtonVariant variant;
  final ActionButtonSize size;
  final bool isLoading;
  final bool enabled;

  const ActionButtonViewModel({
    required this.text,
    required this.onPressed,
    this.variant = ActionButtonVariant.primary,
    this.size = ActionButtonSize.medium,
    this.isLoading = false,
    this.enabled = true,
  });
}
