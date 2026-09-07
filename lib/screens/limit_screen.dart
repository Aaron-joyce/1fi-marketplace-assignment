import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_decorations.dart';
import '../core/constants/app_spacing.dart';
import '../core/constants/app_typography.dart';
import '../widgets/common/section_header.dart';

class LimitScreen extends StatelessWidget {
  const LimitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + AppSpacing.paddingMd,
          left: AppSpacing.paddingMd,
          right: AppSpacing.paddingMd,
          bottom: AppSpacing.bottomNavSpacer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Credit Limit',
              style: AppTypography.titleLarge,
            ),
            const SizedBox(height: AppSpacing.paddingMd),

            // Limit Summary Card
            Container(
              padding: const EdgeInsets.all(AppSpacing.paddingLg),
              decoration: BoxDecoration(
                gradient: AppDecorations.heroPurpleGradient,
                borderRadius: AppSpacing.borderRadiusCard,
                boxShadow: AppDecorations.softShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1FI CREDIT LIMIT',
                        style: AppTypography.heroSmallBadge.copyWith(
                          color: AppColors.textLightPurple,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.accentGold,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'ACTIVE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.paddingSm),
                  const Text(
                    '₹5,00,000.00',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.paddingMd),

                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: LinearProgressIndicator(
                      value: 0.27,
                      minHeight: 6.0,
                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accentGold),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.paddingSm),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Utilized: ₹1,34,900',
                        style: AppTypography.heroSubtitle.copyWith(fontSize: 12.0),
                      ),
                      Text(
                        'Available: ₹3,65,100',
                        style: AppTypography.heroSubtitle.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.paddingLg),

            // PORTFOLIO COLLATERAL Section
            const SectionHeader(title: 'PORTFOLIO COLLATERAL'),
            const SizedBox(height: AppSpacing.paddingSm),

            Container(
              padding: const EdgeInsets.all(AppSpacing.paddingMd),
              decoration: AppDecorations.cardDecoration,
              child: Row(
                children: [
                  Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: AppColors.successGreenLight,
                      borderRadius: AppSpacing.borderRadiusLogo,
                    ),
                    child: const Icon(
                      Icons.show_chart_rounded,
                      color: AppColors.successGreen,
                      size: 26.0,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.paddingMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Pledged Mutual Funds',
                          style: AppTypography.cardTitle,
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          'Equity & Hybrid Funds (CAMS/KFintech)',
                          style: AppTypography.cardSubtitle,
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '₹6,85,000',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
