import 'package:flutter/material.dart';

import '../common/theme/app_colors.dart';
import '../common/theme/app_radius.dart';
import '../common/theme/app_spacing.dart';
import '../common/theme/app_text_styles.dart';
import '../components/action_button/action_button_component.dart';
import '../components/action_button/action_button_factory.dart';

class SampleLoginScreen extends StatefulWidget {
  const SampleLoginScreen({super.key});

  @override
  State<SampleLoginScreen> createState() => _SampleLoginScreenState();
}

class _SampleLoginScreenState extends State<SampleLoginScreen> {
  bool showLogin = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome & Login')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const Icon(Icons.favorite_rounded, size: 76, color: AppColors.primary),
          const SizedBox(height: AppSpacing.sm),
          const Text('DuoHeart', style: AppTextStyles.title, textAlign: TextAlign.center),
          const SizedBox(
            height: 220,
            child: Image(
              image: AssetImage('arquivos/bixinhoFOFO.png'),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            showLogin ? 'Entre para continuar seu plano.' : 'Seu treino começa com um pequeno passo.',
            style: AppTextStyles.body.copyWith(color: AppColors.muted),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          if (showLogin) ...[
            _InputField(label: 'Login', icon: Icons.person_outline),
            const SizedBox(height: AppSpacing.sm),
            _InputField(
              label: 'Password',
              icon: obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              onIconPressed: () => setState(() => obscurePassword = !obscurePassword),
              obscureText: obscurePassword,
            ),
            const SizedBox(height: AppSpacing.lg),
            DuoActionButton(
              viewModel: ActionButtonFactory.primary(
                text: 'Fazer login',
                onPressed: () => _showMessage('Login enviado'),
              ),
            ),
          ] else ...[
            DuoActionButton(
              viewModel: ActionButtonFactory.secondary(
                text: 'Comece agora',
                onPressed: () => setState(() => showLogin = true),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextButton(
              onPressed: () => setState(() => showLogin = true),
              child: const Text('Já tenho uma conta'),
            ),
          ],
        ],
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onIconPressed;
  final bool obscureText;

  const _InputField({
    required this.label,
    required this.icon,
    this.onIconPressed,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: const Icon(Icons.circle, size: 8, color: AppColors.primary),
        suffixIcon: IconButton(onPressed: onIconPressed, icon: Icon(icon)),
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.medium),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}