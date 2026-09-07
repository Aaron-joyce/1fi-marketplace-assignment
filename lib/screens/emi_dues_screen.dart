import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_decorations.dart';
import '../core/constants/app_spacing.dart';
import '../core/constants/app_typography.dart';
import '../widgets/common/section_header.dart';

class EmiDuesScreen extends StatelessWidget {
  const EmiDuesScreen({super.key});

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
              'EMI Dues',
              style: AppTypography.titleLarge,
            ),
            const SizedBox(height: AppSpacing.paddingMd),

            // Summary Card
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
                  Text(
                    'NEXT EMI DUE ON 5TH OCT 2026',
                    style: AppTypography.heroSmallBadge.copyWith(
                      color: AppColors.accentGold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.paddingSm),
                  const Text(
                    '₹11,241.00',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.paddingSm),
                  Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline_rounded,
                        size: 16.0,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 6.0),
                      Text(
                        'Auto-debit active via HDFC Bank (NACH)',
                        style: AppTypography.heroSubtitle.copyWith(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.paddingLg),

            // ACTIVE LOANS Section
            const SectionHeader(title: 'ACTIVE EMI LOANS'),
            const SizedBox(height: AppSpacing.paddingSm),

            // Loan Item Card
            Container(
              padding: const EdgeInsets.all(AppSpacing.paddingMd),
              decoration: AppDecorations.cardDecoration,
              child: Row(
                children: [
                  Container(
                    width: 52.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: AppColors.primaryPurple.withValues(alpha: 0.1),
                      borderRadius: AppSpacing.borderRadiusLogo,
                    ),
                    child: const Icon(
                      Icons.phone_iphone_rounded,
                      color: AppColors.primaryPurple,
                      size: 28.0,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.paddingMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'iPhone 15 Pro Max',
                          style: AppTypography.cardTitle,
                        ),
                        const SizedBox(height: 2.0),
                        Text(
                          '12 Months 0% EMI • 4/12 Paid',
                          style: AppTypography.cardSubtitle.copyWith(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        '₹11,241/mo',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        '8 EMIs Left',
                        style: TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryPurple,
                        ),
                      ),
                    ],
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
