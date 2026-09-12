import 'package:flutter/material.dart';

import '../../common/theme/app_colors.dart';
import '../../common/theme/app_radius.dart';

class DuoProgressBar extends StatelessWidget {
  final double value;
  final String? label;
  final Color? valueColor;

  const DuoProgressBar({
    super.key,
    required this.value,
    this.label,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final clampedValue = value.clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 6),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.small),
          child: LinearProgressIndicator(
            value: clampedValue,
            minHeight: 10,
            color: valueColor ?? AppColors.primary,
            backgroundColor: Theme.of(context).colorScheme.onSurface
                .withValues(alpha: .12),
          ),
        ),
      ],
    );
  }
}
