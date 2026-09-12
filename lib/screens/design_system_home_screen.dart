import 'package:flutter/material.dart';

import '../common/theme/app_spacing.dart';
import '../common/theme/app_text_styles.dart';
import 'sample_action_button_screen.dart';
import 'sample_dashboard_screen.dart';
import 'sample_login_screen.dart';
import 'sample_list_item_screen.dart';
import 'sample_tab_bar_screen.dart';
import 'sample_workout_screen.dart';
import 'sample_foundations_screen.dart';
import 'sample_welcome_screen.dart';

class DesignSystemHomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const DesignSystemHomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DuoHeart Design System'),
        actions: [
          IconButton(
            tooltip: isDarkMode ? 'Usar modo claro' : 'Usar modo escuro',
            onPressed: () => onThemeChanged(!isDarkMode),
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const Text('Componentes', style: AppTextStyles.title),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Peças reutilizáveis inspiradas no protótipo do DuoHeart.',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: AppSpacing.lg),
          _CatalogTile(
            icon: Icons.favorite_rounded,
            title: 'Welcome Screen',
            subtitle: 'Tela inicial inspirada no protótipo do DuoHeart',
            onTap: () => _open(context, const SampleWelcomeScreen()),
          ),
          const SizedBox(height: AppSpacing.sm),
          _CatalogTile(
            icon: Icons.palette_outlined,
            title: 'Foundations',
            subtitle: 'Cores, fontes, estados, progresso e alertas',
            onTap: () => _open(context, const SampleFoundationsScreen()),
          ),
          const SizedBox(height: AppSpacing.sm),
          _CatalogTile(
            icon: Icons.touch_app_outlined,
            title: 'Action Button',
            subtitle: 'Ações primárias e secundárias',
            onTap: () => _open(context, const SampleActionButtonScreen()),
          ),
          const SizedBox(height: AppSpacing.sm),
          _CatalogTile(
            icon: Icons.dashboard_outlined,
            title: 'Tab Bar',
            subtitle: 'Navegação principal do aplicativo',
            onTap: () => _open(context, const SampleTabBarScreen()),
          ),
          const SizedBox(height: AppSpacing.sm),
          _CatalogTile(
            icon: Icons.view_list_outlined,
            title: 'List Items',
            subtitle: 'Opções, categorias e preferências',
            onTap: () => _open(context, const SampleListItemScreen()),
          ),
          const SizedBox(height: AppSpacing.sm),
          _CatalogTile(
            icon: Icons.waving_hand_outlined,
            title: 'Welcome & Login',
            subtitle: 'Entrada, formulário e chamada principal',
            onTap: () => _open(context, const SampleLoginScreen()),
          ),
          const SizedBox(height: AppSpacing.sm),
          _CatalogTile(
            icon: Icons.grid_view_rounded,
            title: 'Home Dashboard',
            subtitle: 'Atalhos, progresso e navegação inferior',
            onTap: () => _open(context, const SampleDashboardScreen()),
          ),
          const SizedBox(height: AppSpacing.sm),
          _CatalogTile(
            icon: Icons.timer_outlined,
            title: 'Workout Session',
            subtitle: 'Seleção de exercício, timer e conclusão',
            onTap: () => _open(context, const SampleWorkoutScreen()),
          ),
        ],
      ),
    );
  }

  void _open(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }
}

class _CatalogTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _CatalogTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          child: Icon(icon),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
