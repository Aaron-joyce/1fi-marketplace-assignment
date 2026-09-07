import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../../providers/marketplace_provider.dart';

class EmiCheckoutModal extends StatelessWidget {
  const EmiCheckoutModal({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MarketplaceProvider>(context);
    final product = provider.selectedProduct;
    final variant = provider.selectedVariant;
    final emiPlan = provider.selectedEmiPlan;

    if (product == null || emiPlan == null) return const SizedBox.shrink();

    final isSuccess = provider.isCheckoutSuccess;

    return Container(
      padding: EdgeInsets.only(
        top: AppSpacing.paddingLg,
        left: AppSpacing.paddingLg,
        right: AppSpacing.paddingLg,
        bottom: MediaQuery.of(context).padding.bottom + AppSpacing.paddingLg,
      ),
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusCard),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 36.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.paddingMd),

          if (isSuccess) ...[
            // Order Success State
            Center(
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.paddingMd),
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      color: AppColors.successGreenLight,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle_rounded,
                      size: 48,
                      color: AppColors.successGreen,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.paddingMd),
                  const Text(
                    'EMI Financing Approved!',
                    style: AppTypography.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.paddingSm),
                  Text(
                    'Your 1Fi 0% EMI financing for ${product.name} has been set up against your mutual fund holdings.',
                    style: AppTypography.cardSubtitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.paddingXl),
                  SizedBox(
                    width: double.infinity,
                    height: 52.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        provider.resetCheckoutState();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppSpacing.borderRadiusPill,
                        ),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            // Checkout Summary State
            const Text(
              'Order & EMI Summary',
              style: AppTypography.titleLarge,
            ),
            const SizedBox(height: AppSpacing.paddingMd),

            // Product Item Summary Card
            Container(
              padding: const EdgeInsets.all(AppSpacing.paddingMd),
              decoration: BoxDecoration(
                color: AppColors.screenBackground,
                borderRadius: AppSpacing.borderRadiusCard,
              ),
              child: Row(
                children: [
                  Icon(
                    product.iconData,
                    size: 36,
                    color: AppColors.primaryPurple,
                  ),
                  const SizedBox(width: AppSpacing.paddingMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: AppTypography.cardTitle.copyWith(fontSize: 14.0),
                        ),
                        if (variant != null)
                          Text(
                            variant.name,
                            style: AppTypography.cardSubtitle.copyWith(fontSize: 12.0),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    '₹${provider.calculatedTotalPrice.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.paddingMd),

            // EMI Payment Breakdown
            Container(
              padding: const EdgeInsets.all(AppSpacing.paddingMd),
              decoration: BoxDecoration(
                color: AppColors.pillTabContainer.withValues(alpha: 0.5),
                borderRadius: AppSpacing.borderRadiusCard,
                border: Border.all(
                  color: AppColors.primaryPurple.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                children: [
                  _buildSummaryRow(
                    'EMI Plan',
                    '${emiPlan.tenureMonths} Months (${emiPlan.isNoCost ? "0% Interest" : "Standard"})',
                  ),
                  const Divider(height: 16.0),
                  _buildSummaryRow(
                    'Monthly Installment',
                    '₹${provider.calculatedMonthlyAmount.toStringAsFixed(0)} / mo',
                    isBold: true,
                  ),
                  const Divider(height: 16.0),
                  _buildSummaryRow('Processing Fee', '₹0 (Free)'),
                  const Divider(height: 16.0),
                  _buildSummaryRow(
                    'Collateral Backing',
                    'Mutual Fund Investment',
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.paddingLg),

            // Mutual Fund Pledge Info Notice
            Row(
              children: [
                const Icon(
                  Icons.shield_outlined,
                  size: 20.0,
                  color: AppColors.primaryPurple,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'No credit score check required. Lien created seamlessly against your mutual fund portfolio.',
                    style: AppTypography.cardSubtitle.copyWith(fontSize: 11.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.paddingLg),

            // CTA Button
            SizedBox(
              width: double.infinity,
              height: 52.0,
              child: ElevatedButton(
                onPressed: () {
                  provider.confirmCheckout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPurple,
                  shadowColor: AppColors.primaryPurple.withValues(alpha: 0.4),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppSpacing.borderRadiusPill,
                  ),
                ),
                child: Text(
                  'Confirm & Start ₹${provider.calculatedMonthlyAmount.toStringAsFixed(0)}/mo EMI',
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.cardSubtitle.copyWith(fontSize: 13.0),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.5,
            fontWeight: isBold ? FontWeight.w900 : FontWeight.w700,
            color: isBold ? AppColors.primaryPurple : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
