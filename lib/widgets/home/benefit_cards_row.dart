import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_decorations.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';

class BenefitCardsRow extends StatelessWidget {
  const BenefitCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingMd),
      child: Row(
        children: [
          // Benefit Card 1: Keep growing
          Expanded(
            child: _buildBenefitCard(
              icon: Icons.trending_up_rounded,
              iconBgColor: const Color(0xFFE8F8F0),
              iconColor: const Color(0xFF2DBE76),
              title: 'Keep growing',
              subtitle: 'No tax, no exit load.',
            ),
          ),
          const SizedBox(width: AppSpacing.paddingMd),
          // Benefit Card 2: 0% interest
          Expanded(
            child: _buildBenefitCard(
              icon: Icons.percent_rounded,
              iconBgColor: const Color(0xFFF3EDFC),
              iconColor: AppColors.primaryPurple,
              title: '0% interest',
              subtitle: 'Repay only what you spend.',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitCard({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.paddingMd),
      decoration: AppDecorations.cardDecoration,
      child: Row(
        children: [
          Container(
            width: 44.0,
            height: 44.0,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 22.0,
            ),
          ),
          const SizedBox(width: AppSpacing.paddingSm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.cardTitle.copyWith(fontSize: 14.0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2.0),
                Text(
                  subtitle,
                  style: AppTypography.cardSubtitle.copyWith(fontSize: 11.0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
