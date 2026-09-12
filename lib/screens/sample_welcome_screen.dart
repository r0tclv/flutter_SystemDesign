import 'package:flutter/material.dart';

import '../common/theme/app_colors.dart';
import '../common/theme/app_spacing.dart';
import '../common/theme/app_text_styles.dart';
import '../components/action_button/action_button_component.dart';
import '../components/action_button/action_button_factory.dart';
import '../components/action_button/action_button_view_model.dart';
import 'sample_login_screen.dart';

class SampleWelcomeScreen extends StatelessWidget {
  const SampleWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final mascotHeight = (constraints.maxHeight * .47).clamp(
              240.0,
              390.0,
            );

            return ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.md,
              ),
              children: [
                const Text(
                  'DuoHeart',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: mascotHeight,
                  child: Image.asset(
                    'arquivos/bixinhoFOFO.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                DuoActionButton(
                  viewModel: ActionButtonFactory.secondary(
                    text: 'Comece agora',
                    size: ActionButtonSize.large,
                    onPressed: () => _openLogin(context),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                DuoActionButton(
                  viewModel: ActionButtonFactory.secondary(
                    text: 'Faça login',
                    size: ActionButtonSize.small,
                    onPressed: () => _openLogin(context),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Cuide de você, um pequeno passo por vez.',
                  style: AppTextStyles.body.copyWith(color: AppColors.muted),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _openLogin(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const SampleLoginScreen()));
  }
}
