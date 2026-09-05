import 'package:flutter/material.dart';

import '../common/theme/app_spacing.dart';
import '../common/theme/app_text_styles.dart';
import '../components/action_button/action_button_component.dart';
import '../components/action_button/action_button_factory.dart';

class SampleActionButtonScreen extends StatelessWidget {
  const SampleActionButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Action Button')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const Text('Variações', style: AppTextStyles.heading),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Um único componente para as ações principais do DuoHeart.',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: AppSpacing.lg),
          DuoActionButton(
            viewModel: ActionButtonFactory.primary(
              text: 'Continuar',
              onPressed: () => _showFeedback(context, 'Ação principal'),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          DuoActionButton(
            viewModel: ActionButtonFactory.secondary(
              text: 'Comece agora',
              onPressed: () => _showFeedback(context, 'Ação secundária'),
            ),
          ),
        ],
      ),
    );
  }

  void _showFeedback(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
