import 'package:flutter/material.dart';

import '../../common/theme/app_colors.dart';
import '../../common/theme/app_radius.dart';
import '../../common/theme/app_text_styles.dart';
import 'action_button_view_model.dart';

class DuoActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const DuoActionButton({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final isPrimary = viewModel.variant == ActionButtonVariant.primary;
    final isDanger = viewModel.variant == ActionButtonVariant.danger;
    final height = switch (viewModel.size) {
      ActionButtonSize.small => 40.0,
      ActionButtonSize.medium => 52.0,
      ActionButtonSize.large => 64.0,
    };

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: viewModel.enabled && !viewModel.isLoading
            ? viewModel.onPressed
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDanger
              ? AppColors.danger
              : isPrimary
              ? AppColors.dark
              : AppColors.white,
          foregroundColor: isPrimary || isDanger
              ? AppColors.white
              : AppColors.dark,
          disabledBackgroundColor: AppColors.border,
          disabledForegroundColor: AppColors.muted,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.medium),
          ),
        ),
        child: viewModel.isLoading
            ? const SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(viewModel.text, style: AppTextStyles.button),
      ),
    );
  }
}
