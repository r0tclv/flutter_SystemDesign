import 'package:flutter/material.dart';

import '../common/theme/app_spacing.dart';
import '../common/theme/app_text_styles.dart';
import '../components/duo_tab_bar/duo_tab_bar_component.dart';
import '../components/duo_tab_bar/duo_tab_item.dart';

class SampleTabBarScreen extends StatefulWidget {
  const SampleTabBarScreen({super.key});

  @override
  State<SampleTabBarScreen> createState() => _SampleTabBarScreenState();
}

class _SampleTabBarScreenState extends State<SampleTabBarScreen> {
  int selectedIndex = 0;

  static const items = [
    DuoTabItem(icon: Icons.home_outlined, label: 'Início'),
    DuoTabItem(icon: Icons.fitness_center_outlined, label: 'Plano'),
    DuoTabItem(icon: Icons.flag_outlined, label: 'Metas'),
    DuoTabItem(icon: Icons.person_outline, label: 'Perfil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab Bar')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Text(
            'Área selecionada: ${items[selectedIndex].label}',
            style: AppTextStyles.heading,
            textAlign: TextAlign.center,
          ),
        ),
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
}
