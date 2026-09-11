import 'package:flutter/material.dart';

import 'action_button_view_model.dart';

class ActionButtonFactory {
  ActionButtonFactory._();

  static ActionButtonViewModel primary({
    required String text,
    required VoidCallback onPressed,
    bool enabled = true,
  }) {
    return ActionButtonViewModel(
      text: text,
      onPressed: onPressed,
      enabled: enabled,
    );
  }

  static ActionButtonViewModel secondary({
    required String text,
    required VoidCallback onPressed,
    bool enabled = true,
  }) {
    return ActionButtonViewModel(
      text: text,
      onPressed: onPressed,
      variant: ActionButtonVariant.secondary,
      enabled: enabled,
    );
  }
}
