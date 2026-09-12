import 'dart:async';

import 'package:flutter/material.dart';

import '../common/theme/app_colors.dart';
import '../common/theme/app_radius.dart';
import '../common/theme/app_spacing.dart';
import '../common/theme/app_text_styles.dart';
import '../components/action_button/action_button_component.dart';
import '../components/action_button/action_button_factory.dart';

class SampleWorkoutScreen extends StatefulWidget {
  const SampleWorkoutScreen({super.key});

  @override
  State<SampleWorkoutScreen> createState() => _SampleWorkoutScreenState();
}

class _SampleWorkoutScreenState extends State<SampleWorkoutScreen> {
  Timer? timer;
  int elapsedSeconds = 0;
  bool isRunning = false;
  int selectedExercise = 0;

  final exercises = const [
    (Icons.fitness_center_outlined, 'Força'),
    (Icons.self_improvement_outlined, 'Mobilidade'),
    (Icons.directions_run_outlined, 'Cardio'),
  ];

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Session')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const Text('Escolha seu foco', style: AppTextStyles.heading),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            height: 104,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: exercises.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: AppSpacing.sm),
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                final selected = selectedExercise == index;
                return InkWell(
                  onTap: () => setState(() => selectedExercise = index),
                  borderRadius: BorderRadius.circular(AppRadius.medium),
                  child: Container(
                    width: 112,
                    decoration: BoxDecoration(
                      color: selected ? AppColors.primary : AppColors.white,
                      borderRadius: BorderRadius.circular(AppRadius.medium),
                      border: Border.all(
                        color: selected ? AppColors.primary : AppColors.border,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(exercise.$1),
                        const SizedBox(height: 6),
                        Text(exercise.$2),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.large),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.self_improvement_rounded,
                  size: 96,
                  color: AppColors.primary,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(_formatTime(elapsedSeconds), style: AppTextStyles.title),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  isRunning ? 'Sessão em andamento' : 'Pronto para começar',
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          DuoActionButton(
            viewModel: ActionButtonFactory.primary(
              text: isRunning ? 'Pausar sessão' : 'Começar sessão',
              onPressed: _toggleTimer,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          DuoActionButton(
            viewModel: ActionButtonFactory.secondary(
              text: 'Finalizar',
              onPressed: _finishSession,
              enabled: elapsedSeconds > 0,
            ),
          ),
        ],
      ),
    );
  }

  void _toggleTimer() {
    if (isRunning) {
      timer?.cancel();
    } else {
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (mounted) setState(() => elapsedSeconds++);
      });
    }
    setState(() => isRunning = !isRunning);
  }

  void _finishSession() {
    timer?.cancel();
    setState(() => isRunning = false);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Sessão concluída')));
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }
}
