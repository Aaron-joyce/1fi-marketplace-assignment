import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/constants/app_spacing.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.paddingSm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 3.5,
            height: 14.0,
            decoration: BoxDecoration(
              color: AppColors.primaryPurple,
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          const SizedBox(width: AppSpacing.paddingSm),
          Expanded(
            child: Text(
              title.toUpperCase(),
              style: AppTypography.sectionHeader,
            ),
          ),
        ],
      ),
    );
  }
}
