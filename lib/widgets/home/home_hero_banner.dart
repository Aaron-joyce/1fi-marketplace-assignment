import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../common/base_hero_banner.dart';

class HomeHeroBanner extends StatelessWidget {
  final VoidCallback? onCheckEligibility;

  const HomeHeroBanner({
    super.key,
    this.onCheckEligibility,
  });

  @override
  Widget build(BuildContext context) {
    return BaseHeroBanner(
      isFullBleed: false,
      topBadge: Text(
        'GET STARTED',
        style: AppTypography.heroSmallBadge.copyWith(
          color: AppColors.textLightPurple,
        ),
      ),
      headline: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Shop on ',
                    style: AppTypography.heroHeadlineBold,
                  ),
                  TextSpan(
                    text: 'no-cost EMI',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w800,
                      color: AppColors.accentGold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '0%\n',
                    style: TextStyle(
                      fontSize: 44.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      height: 0.9,
                    ),
                  ),
                  TextSpan(
                    text: 'INTEREST',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w900,
                      color: AppColors.accentGold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      subtitle: 'Backed by your mutual funds, No credit pull, No charges, & quick approval.',
      bottomContent: ElevatedButton(
        onPressed: onCheckEligibility ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 12.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusPill,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Check eligibility',
              style: AppTypography.heroCtaText,
            ),
            SizedBox(width: 8.0),
            Icon(
              Icons.arrow_forward_rounded,
              size: 18.0,
              color: AppColors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
