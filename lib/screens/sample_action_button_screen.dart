import 'package:flutter/material.dart';

import '../common/theme/app_spacing.dart';
import '../common/theme/app_text_styles.dart';
import '../components/action_button/action_button_component.dart';
import '../components/action_button/action_button_factory.dart';
import '../components/action_button/action_button_view_model.dart';

class SampleActionButtonScreen extends StatefulWidget {
  const SampleActionButtonScreen({super.key});

  @override
  State<SampleActionButtonScreen> createState() =>
      _SampleActionButtonScreenState();
}

class _SampleActionButtonScreenState extends State<SampleActionButtonScreen> {
  bool isLoading = false;

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
          const Text('Tipos e tamanhos', style: AppTextStyles.heading),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Cada tamanho mantém a mesma ação e muda apenas a presença visual.',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: AppSpacing.md),
          DuoActionButton(
            viewModel: ActionButtonFactory.primary(
              text: 'Pequeno',
              size: ActionButtonSize.small,
              onPressed: () => _showFeedback(context, 'Botão pequeno'),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          DuoActionButton(
            viewModel: ActionButtonFactory.primary(
              text: 'Médio',
              size: ActionButtonSize.medium,
              onPressed: () => _showFeedback(context, 'Botão médio'),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          DuoActionButton(
            viewModel: ActionButtonFactory.primary(
              text: 'Grande',
              size: ActionButtonSize.large,
              onPressed: () => _showFeedback(context, 'Botão grande'),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          DuoActionButton(
            viewModel: ActionButtonFactory.danger(
              text: 'Excluir treino',
              onPressed: () => _showFeedback(context, 'Ação de alerta'),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const Text('Loading e variações', style: AppTextStyles.heading),
          const SizedBox(height: AppSpacing.sm),
          DuoActionButton(
            viewModel: ActionButtonFactory.primary(
              text: 'Continuar',
              onPressed: _runAction,
              isLoading: isLoading,
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

  Future<void> _runAction() async {
    setState(() => isLoading = true);
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    setState(() => isLoading = false);
    _showFeedback(context, 'Ação concluída com sucesso');
  }

  void _showFeedback(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
