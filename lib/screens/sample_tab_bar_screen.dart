import 'package:flutter/material.dart';

import '../common/theme/app_colors.dart';
import '../common/theme/app_radius.dart';
import '../common/theme/app_spacing.dart';
import '../common/theme/app_text_styles.dart';
import '../components/action_button/action_button_component.dart';
import '../components/action_button/action_button_factory.dart';
import '../components/duo_tab_bar/duo_tab_bar_component.dart';
import '../components/duo_tab_bar/duo_tab_item.dart';
import '../components/progress_bar/progress_bar_component.dart';

class SampleTabBarScreen extends StatefulWidget {
  const SampleTabBarScreen({super.key});

  @override
  State<SampleTabBarScreen> createState() => _SampleTabBarScreenState();
}

class _SampleTabBarScreenState extends State<SampleTabBarScreen> {
  int selectedIndex = 0;
  bool showProfileError = false;

  static const items = [
    DuoTabItem(icon: Icons.home_outlined, label: 'Início'),
    DuoTabItem(icon: Icons.fitness_center_outlined, label: 'Plano'),
    DuoTabItem(icon: Icons.flag_outlined, label: 'Metas', badgeCount: 3),
    DuoTabItem(icon: Icons.person_outline, label: 'Perfil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab Bar')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(items[selectedIndex].label, style: AppTextStyles.title),
          const SizedBox(height: AppSpacing.sm),
          Text(_descriptionForSelectedTab, style: AppTextStyles.body),
          const SizedBox(height: AppSpacing.lg),
          _contentForSelectedTab,
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: DuoTabBar(
          items: items,
          selectedIndex: selectedIndex,
          onChanged: (index) => setState(() => selectedIndex = index),
        ),
      ),
    );
  }

  String get _descriptionForSelectedTab {
    return switch (selectedIndex) {
      0 => 'Acompanhe o carregamento e o progresso do seu dia.',
      1 => 'Veja alguns treinos disponíveis para começar.',
      2 => 'Organize suas metas e acompanhe cada conquista.',
      _ => 'Área de perfil com retorno visual para situações de erro.',
    };
  }

  Widget get _contentForSelectedTab {
    return switch (selectedIndex) {
      0 => const _HomeTabContent(),
      1 => const _PlanTabContent(),
      2 => const _GoalsTabContent(),
      _ => _ProfileTabContent(
        showError: showProfileError,
        onShowError: () => setState(() => showProfileError = true),
      ),
    };
  }
}

class _HomeTabContent extends StatelessWidget {
  const _HomeTabContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Carregando seu resumo', style: AppTextStyles.heading),
        const SizedBox(height: AppSpacing.md),
        const Center(child: CircularProgressIndicator()),
        const SizedBox(height: AppSpacing.lg),
        const DuoProgressBar(value: .58, label: 'Progresso semanal: 58%'),
      ],
    );
  }
}

class _PlanTabContent extends StatelessWidget {
  const _PlanTabContent();

  @override
  Widget build(BuildContext context) {
    const workouts = [
      ('Força', '20 min · 6 exercícios', Icons.fitness_center_outlined),
      ('Mobilidade', '15 min · iniciante', Icons.self_improvement_outlined),
      ('Cardio', '30 min · moderado', Icons.directions_run_outlined),
    ];

    return Column(
      children: workouts
          .map(
            (workout) => Card(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Icon(workout.$3, color: AppColors.dark),
                ),
                title: Text(workout.$1),
                subtitle: Text(workout.$2),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _GoalsTabContent extends StatelessWidget {
  const _GoalsTabContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _GoalRow(title: 'Treinar 3 vezes', progress: .66),
        SizedBox(height: AppSpacing.sm),
        _GoalRow(title: 'Beber 2 litros de água', progress: .42),
        SizedBox(height: AppSpacing.sm),
        _GoalRow(title: 'Dormir 8 horas', progress: .8),
      ],
    );
  }
}

class _GoalRow extends StatelessWidget {
  final String title;
  final double progress;

  const _GoalRow({required this.title, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: DuoProgressBar(value: progress, label: title),
      ),
    );
  }
}

class _ProfileTabContent extends StatelessWidget {
  final bool showError;
  final VoidCallback onShowError;

  const _ProfileTabContent({
    required this.showError,
    required this.onShowError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showError)
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.danger.withValues(alpha: .12),
              borderRadius: BorderRadius.circular(AppRadius.medium),
              border: Border.all(color: AppColors.danger),
            ),
            child: const Row(
              children: [
                Icon(Icons.error_outline, color: AppColors.danger),
                SizedBox(width: AppSpacing.sm),
                Expanded(child: Text('Não foi possível carregar o perfil.')),
              ],
            ),
          ),
        if (showError) const SizedBox(height: AppSpacing.md),
        DuoActionButton(
          viewModel: ActionButtonFactory.danger(
            text: 'Simular erro',
            onPressed: () {
              onShowError();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Erro ao atualizar o perfil')),
              );
            },
          ),
        ),
      ],
    );
  }
}
