import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../../models/product_model.dart';
import '../../providers/marketplace_provider.dart';
import '../../widgets/common/section_header.dart';
import '../../widgets/marketplace/emi_checkout_modal.dart';
import '../../widgets/marketplace/emi_plan_card.dart';
import '../../widgets/marketplace/variant_selector.dart';

class ProductDetailModal extends StatelessWidget {
  final ProductModel product;

  const ProductDetailModal({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MarketplaceProvider>(context);
    final selectedVariant = provider.selectedVariant;
    final selectedEmiPlan = provider.selectedEmiPlan;
    final brandColor = AppColors.getBrandColor(product.brandColorKey);

    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusCard),
        ),
      ),
      child: Column(
        children: [
          // Drag Handle & Top Title Bar
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 32.0),
                Container(
                  width: 36.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded),
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),

          // Scrollable Detail Body
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingLg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Banner Image Container
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 160.0,
                      decoration: BoxDecoration(
                        color: brandColor.withValues(alpha: 0.08),
                        borderRadius: AppSpacing.borderRadiusCard,
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            product.iconData,
                            size: 72.0,
                            color: brandColor == Colors.black
                                ? AppColors.textPrimary
                                : brandColor,
                          ),
                          const SizedBox(height: 8.0),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 3.0,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.cardBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            child: Text(
                              product.category.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primaryPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.paddingMd),

                  // Brand & Title
                  Text(
                    product.brandName.toUpperCase(),
                    style: AppTypography.heroSmallBadge.copyWith(
                      color: AppColors.primaryPurple,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    product.name,
                    style: AppTypography.titleLarge.copyWith(fontSize: 22.0),
                  ),
                  const SizedBox(height: 6.0),

                  // Rating & Total Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: AppColors.accentGold,
                            size: 18.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            '${product.rating} (${product.reviewCount} customer reviews)',
                            style: AppTypography.cardSubtitle,
                          ),
                        ],
                      ),
                      Text(
                        '₹${provider.calculatedTotalPrice.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.paddingMd),

                  // Description
                  Text(
                    product.description,
                    style: AppTypography.cardSubtitle.copyWith(height: 1.4),
                  ),
                  const SizedBox(height: AppSpacing.paddingLg),

                  // Variants Choice Chips
                  if (product.variants.isNotEmpty) ...[
                    VariantSelector(
                      variants: product.variants,
                      selectedVariant: selectedVariant,
                      onVariantSelected: (variant) {
                        provider.selectVariant(variant);
                      },
                    ),
                    const SizedBox(height: AppSpacing.paddingLg),
                  ],

                  // Feature Highlights
                  const SectionHeader(title: 'KEY HIGHLIGHTS'),
                  const SizedBox(height: AppSpacing.paddingSm),
                  ...product.highlights.map(
                    (highlight) => Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 4.0, right: 8.0),
                            child: Icon(
                              Icons.check_circle_rounded,
                              size: 14.0,
                              color: AppColors.primaryPurple,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              highlight,
                              style: AppTypography.cardSubtitle.copyWith(
                                color: AppColors.textPrimary,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.paddingLg),

                  // EMI Plans Section
                  const SectionHeader(title: 'SELECT 0% EMI PLAN'),
                  const SizedBox(height: AppSpacing.paddingSm),
                  ...product.emiPlans.map(
                    (plan) => EmiPlanCard(
                      plan: plan,
                      totalPrice: provider.calculatedTotalPrice,
                      isSelected: selectedEmiPlan?.id == plan.id,
                      onTap: () {
                        provider.selectEmiPlan(plan);
                      },
                    ),
                  ),

                  const SizedBox(height: AppSpacing.bottomNavSpacer),
                ],
              ),
            ),
          ),

          // Sticky Bottom CTA Bar
          Container(
            padding: EdgeInsets.only(
              top: AppSpacing.paddingMd,
              left: AppSpacing.paddingLg,
              right: AppSpacing.paddingLg,
              bottom: MediaQuery.of(context).padding.bottom + AppSpacing.paddingMd,
            ),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 10,
                  offset: const Offset(0, -4),
                )
              ],
            ),
            child: Row(
              children: [
                if (selectedEmiPlan != null)
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'SELECTED PLAN',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryPurple,
                          ),
                        ),
                        Text(
                          '₹${provider.calculatedMonthlyAmount.toStringAsFixed(0)}/mo',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          '${selectedEmiPlan.tenureMonths} Months 0% EMI',
                          style: AppTypography.cardSubtitle.copyWith(fontSize: 11.0),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    height: 48.0,
                    child: ElevatedButton(
                      onPressed: selectedEmiPlan == null
                          ? null
                          : () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) => const EmiCheckoutModal(),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPurple,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppSpacing.borderRadiusPill,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Proceed with Plan',
                            style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 6.0),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 16.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
