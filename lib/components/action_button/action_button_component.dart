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

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: viewModel.enabled && !viewModel.isLoading
            ? viewModel.onPressed
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.dark : AppColors.white,
          foregroundColor: isPrimary ? AppColors.white : AppColors.dark,
          disabledBackgroundColor: AppColors.border,
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
