import 'package:flutter/material.dart';

import 'action_button_view_model.dart';

class ActionButtonFactory {
  ActionButtonFactory._();

  static ActionButtonViewModel primary({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ActionButtonViewModel(text: text, onPressed: onPressed);
  }

  static ActionButtonViewModel secondary({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ActionButtonViewModel(
      text: text,
      onPressed: onPressed,
      variant: ActionButtonVariant.secondary,
    );
  }
}
