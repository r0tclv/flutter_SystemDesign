import 'package:flutter/material.dart';

import 'action_button_view_model.dart';

class ActionButtonFactory {
  ActionButtonFactory._();

  static ActionButtonViewModel primary({
    required String text,
    required VoidCallback onPressed,
    bool enabled = true,
    bool isLoading = false,
    ActionButtonSize size = ActionButtonSize.medium,
  }) {
    return ActionButtonViewModel(
      text: text,
      onPressed: onPressed,
      enabled: enabled,
      isLoading: isLoading,
      size: size,
    );
  }

  static ActionButtonViewModel secondary({
    required String text,
    required VoidCallback onPressed,
    bool enabled = true,
    bool isLoading = false,
    ActionButtonSize size = ActionButtonSize.medium,
  }) {
    return ActionButtonViewModel(
      text: text,
      onPressed: onPressed,
      variant: ActionButtonVariant.secondary,
      enabled: enabled,
      isLoading: isLoading,
      size: size,
    );
  }

  static ActionButtonViewModel danger({
    required String text,
    required VoidCallback onPressed,
    bool enabled = true,
    bool isLoading = false,
    ActionButtonSize size = ActionButtonSize.medium,
  }) {
    return ActionButtonViewModel(
      text: text,
      onPressed: onPressed,
      variant: ActionButtonVariant.danger,
      enabled: enabled,
      isLoading: isLoading,
      size: size,
    );
  }
}
