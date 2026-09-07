import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../../models/emi_plan_model.dart';

class EmiPlanCard extends StatelessWidget {
  final EmiPlanModel plan;
  final double totalPrice;
  final bool isSelected;
  final VoidCallback onTap;

  const EmiPlanCard({
    super.key,
    required this.plan,
    required this.totalPrice,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final calculatedMonthly = plan.isNoCost
        ? totalPrice / plan.tenureMonths
        : plan.monthlyAmount;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.only(bottom: AppSpacing.paddingSm),
        padding: const EdgeInsets.all(AppSpacing.paddingMd),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.pillTabContainer.withValues(alpha: 0.5)
              : AppColors.cardBackground,
          borderRadius: AppSpacing.borderRadiusCard,
          border: Border.all(
            color: isSelected ? AppColors.primaryPurple : Colors.grey.shade200,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primaryPurple.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Column(
          children: [
            Row(
              children: [
                // Selection Radio Circle
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? AppColors.primaryPurple : Colors.transparent,
                    border: Border.all(
                      color: isSelected ? AppColors.primaryPurple : Colors.grey.shade400,
                      width: isSelected ? 6.0 : 2.0,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.paddingSm),

                // Tenure & Monthly Amount
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${plan.tenureMonths} Months EMI',
                            style: AppTypography.cardTitle.copyWith(
                              fontSize: 15.0,
                              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                            ),
                          ),
                          if (plan.tag != null) ...[
                            const SizedBox(width: 8.0),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6.0,
                                vertical: 2.0,
                              ),
                              decoration: BoxDecoration(
                                color: plan.isRecommended
                                    ? AppColors.accentGold
                                    : AppColors.primaryPurple,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                plan.tag!,
                                style: TextStyle(
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w900,
                                  color: plan.isRecommended
                                      ? AppColors.textPrimary
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        'Total Repayment: ₹${totalPrice.toStringAsFixed(0)}',
                        style: AppTypography.cardSubtitle.copyWith(fontSize: 11.5),
                      ),
                    ],
                  ),
                ),

                // Monthly Amount Callout
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹${calculatedMonthly.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: isSelected ? AppColors.primaryPurple : AppColors.textPrimary,
                      ),
                    ),
                    const Text(
                      '/ month',
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
