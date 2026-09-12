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
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome & Login')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const Icon(
            Icons.favorite_rounded,
            size: 76,
            color: AppColors.primary,
          ),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'DuoHeart',
            style: AppTextStyles.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 220,
            child: Image(
              image: AssetImage('arquivos/bixinhoFOFO.png'),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            showLogin
                ? 'Entre para continuar seu plano.'
                : 'Seu treino começa com um pequeno passo.',
            style: AppTextStyles.body.copyWith(color: AppColors.muted),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          if (showLogin) ...[
            Form(
              key: formKey,
              child: Column(
                children: [
                  _InputField(
                    label: 'Login',
                    icon: Icons.person_outline,
                    controller: loginController,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Informe seu login'
                        : null,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _InputField(
                    label: 'Password',
                    icon: obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    controller: passwordController,
                    onIconPressed: () =>
                        setState(() => obscurePassword = !obscurePassword),
                    obscureText: obscurePassword,
                    validator: (value) => value == null || value.length < 6
                        ? 'Use pelo menos 6 caracteres'
                        : null,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            DuoActionButton(
              viewModel: ActionButtonFactory.primary(
                text: 'Fazer login',
                onPressed: _submitLogin,
                isLoading: isLoading,
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

  Future<void> _submitLogin() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    setState(() => isLoading = true);
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    setState(() => isLoading = false);
    _showMessage('Login enviado com sucesso');
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onIconPressed;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const _InputField({
    required this.label,
    required this.icon,
    this.onIconPressed,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
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
