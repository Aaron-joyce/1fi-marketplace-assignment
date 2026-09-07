import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_spacing.dart';
import '../core/constants/app_typography.dart';

class MarketplacePlaceholderScreen extends StatelessWidget {
  const MarketplacePlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.paddingLg,
        vertical: AppSpacing.paddingXl * 2,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primaryPurple.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 42,
                color: AppColors.primaryPurple,
              ),
            ),
            const SizedBox(height: AppSpacing.paddingLg),
            const Text(
              '1Fi Marketplace',
              style: AppTypography.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.paddingSm),
            const Text(
              'Explore products and deals available with instant 0% EMI financing. Scaffolding ready for your feature integration.',
              style: AppTypography.cardSubtitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
