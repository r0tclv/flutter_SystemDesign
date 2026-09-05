import 'package:flutter/material.dart';

import '../common/theme/app_spacing.dart';
import '../common/theme/app_text_styles.dart';
import '../components/list_item/list_item_component.dart';

class SampleListItemScreen extends StatelessWidget {
  const SampleListItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Items')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const Text('Opções do perfil', style: AppTextStyles.heading),
          const SizedBox(height: AppSpacing.md),
          DuoListItem(
            title: 'Alimentação',
            subtitle: 'Hábitos e preferências',
            icon: Icons.restaurant_outlined,
            trailing: const Icon(Icons.chevron_right),
          ),
          const SizedBox(height: AppSpacing.sm),
          DuoListItem(
            title: 'Exercício físico',
            subtitle: 'Seu plano de movimento',
            icon: Icons.fitness_center_outlined,
            trailing: const Icon(Icons.chevron_right),
          ),
          const SizedBox(height: AppSpacing.sm),
          DuoListItem(
            title: 'Saúde e bem-estar',
            icon: Icons.favorite_border,
            trailing: Switch(value: true, onChanged: (_) {}),
          ),
        ],
      ),
    );
  }
}
