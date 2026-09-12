import 'package:flutter/material.dart';

import '../common/theme/app_colors.dart';
import '../common/theme/app_radius.dart';
import '../common/theme/app_spacing.dart';
import '../common/theme/app_text_styles.dart';
import '../components/progress_bar/progress_bar_component.dart';

class SampleDashboardScreen extends StatefulWidget {
  const SampleDashboardScreen({super.key});

  @override
  State<SampleDashboardScreen> createState() => _SampleDashboardScreenState();
}

class _SampleDashboardScreenState extends State<SampleDashboardScreen> {
  int selectedShortcut = 0;
  int selectedTab = 0;

  final shortcuts = const [
    (Icons.restaurant_outlined, 'Alimentação'),
    (Icons.health_and_safety_outlined, 'Saúde'),
    (Icons.event_note_outlined, 'Planejamento'),
    (Icons.place_outlined, 'Encontre seu lugar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const Text('Olá, vamos cuidar de você?', style: AppTextStyles.title),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Escolha um atalho para continuar sua jornada.',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.dark,
              borderRadius: BorderRadius.circular(AppRadius.large),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Seu progresso',
                        style: TextStyle(color: AppColors.white),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '3 de 5 dias',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 132,
                  child: DuoProgressBar(
                    value: .6,
                    label: '60%',
                    valueColor: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const Text('Atalhos', style: AppTextStyles.heading),
          const SizedBox(height: AppSpacing.sm),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: shortcuts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              childAspectRatio: 1.55,
            ),
            itemBuilder: (context, index) {
              final shortcut = shortcuts[index];
              final isSelected = selectedShortcut == index;
              return InkWell(
                borderRadius: BorderRadius.circular(AppRadius.medium),
                onTap: () => setState(() => selectedShortcut = index),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.white,
                    borderRadius: BorderRadius.circular(AppRadius.medium),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.border,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(shortcut.$1, color: AppColors.dark),
                      const SizedBox(height: 6),
                      Text(
                        shortcut.$2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        onDestinationSelected: (index) => setState(() => selectedTab = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.checklist_outlined),
            label: 'Plano',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Saúde',
          ),
          NavigationDestination(
            icon: Icon(Icons.place_outlined),
            label: 'Mapa',
          ),
        ],
      ),
    );
  }
}
