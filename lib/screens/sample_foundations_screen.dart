import 'package:flutter/material.dart';

import '../common/theme/app_colors.dart';
import '../common/theme/app_spacing.dart';
import '../common/theme/app_text_styles.dart';
import '../components/action_button/action_button_component.dart';
import '../components/action_button/action_button_factory.dart';
import '../components/progress_bar/progress_bar_component.dart';

class SampleFoundationsScreen extends StatefulWidget {
  const SampleFoundationsScreen({super.key});

  @override
  State<SampleFoundationsScreen> createState() =>
      _SampleFoundationsScreenState();
}

class _SampleFoundationsScreenState extends State<SampleFoundationsScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final lightColors = <(String, String, Color)>[
      ('background', '#EAF5EC', AppColors.background),
      ('primary', '#48ED99', AppColors.primary),
      ('dark', '#234142', AppColors.dark),
      ('muted', '#6B7D78', AppColors.muted),
      ('border', '#D5E5D9', AppColors.border),
    ];
    final darkColors = <(String, String, Color)>[
      ('backgroundDark', '#172827', AppColors.backgroundDark),
      ('primaryDark', '#1DBB73', AppColors.primaryDark),
      ('darkSurface', '#25403E', AppColors.darkSurface),
      ('mutedDark', '#A8C1B8', AppColors.mutedDark),
      ('borderDark', '#3B5B55', AppColors.borderDark),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Foundations')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const Text('Tokens visuais', style: AppTextStyles.heading),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Cores, tipografia e estados compartilhados.',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: AppSpacing.md),
          const Text('Modo claro', style: AppTextStyles.body),
          const SizedBox(height: AppSpacing.sm),
          _colorChips(lightColors),
          const SizedBox(height: AppSpacing.md),
          const Text('Modo escuro', style: AppTextStyles.body),
          const SizedBox(height: AppSpacing.sm),
          _colorChips(darkColors),
          const SizedBox(height: AppSpacing.lg),
          const Text('Tipografia', style: AppTextStyles.heading),
          const SizedBox(height: AppSpacing.sm),
          const Text('Título 28 px / peso 800', style: AppTextStyles.title),
          const SizedBox(height: AppSpacing.sm),
          const Text('Heading 20 px / peso 700', style: AppTextStyles.heading),
          const SizedBox(height: AppSpacing.sm),
          const Text('Body 16 px / altura 1.4', style: AppTextStyles.body),
          const SizedBox(height: AppSpacing.sm),
          Text('Botão 16 px / peso 700', style: AppTextStyles.button),
          const SizedBox(height: AppSpacing.lg),
          const Text('Progresso', style: AppTextStyles.heading),
          const SizedBox(height: AppSpacing.sm),
          const DuoProgressBar(value: .72, label: 'Perfil completo: 72%'),
          const SizedBox(height: AppSpacing.lg),
          const Text('Estados do botão', style: AppTextStyles.heading),
          const SizedBox(height: AppSpacing.sm),
          DuoActionButton(
            viewModel: ActionButtonFactory.primary(
              text: 'Carregar dados',
              onPressed: _loadData,
              isLoading: isLoading,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          DuoActionButton(
            viewModel: ActionButtonFactory.primary(
              text: 'Indisponível',
              onPressed: () {},
              enabled: false,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          OutlinedButton.icon(
            onPressed: _showAlert,
            icon: const Icon(Icons.warning_amber_outlined),
            label: const Text('Abrir alerta'),
          ),
        ],
      ),
    );
  }

  Widget _colorChips(List<(String, String, Color)> colors) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: colors
          .map(
            (color) => Chip(
              avatar: CircleAvatar(backgroundColor: color.$3),
              label: Text('${color.$1} ${color.$2}'),
            ),
          )
          .toList(),
    );
  }

  Future<void> _loadData() async {
    setState(() => isLoading = true);
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    setState(() => isLoading = false);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Dados atualizados')));
  }

  void _showAlert() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Atenção'),
        content: const Text('Confira seus dados antes de continuar.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Entendi'),
          ),
        ],
      ),
    );
  }
}
