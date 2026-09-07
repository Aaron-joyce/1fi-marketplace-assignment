import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_decorations.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final lowestPlan = product.lowestMonthlyPlan;
    final brandColor = AppColors.getBrandColor(product.brandColorKey);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.paddingMd),
        padding: const EdgeInsets.all(AppSpacing.paddingMd),
        decoration: AppDecorations.cardDecoration,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Icon / Brand Badge Container
            Container(
              width: 72.0,
              height: 72.0,
              decoration: BoxDecoration(
                color: brandColor.withValues(alpha: 0.1),
                borderRadius: AppSpacing.borderRadiusLogo,
                border: Border.all(
                  color: brandColor.withValues(alpha: 0.2),
                  width: 1.0,
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    product.iconData,
                    size: 32.0,
                    color: brandColor == Colors.black
                        ? AppColors.textPrimary
                        : brandColor,
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    product.brandWordmark,
                    style: TextStyle(
                      fontSize: 9.0,
                      fontWeight: FontWeight.w900,
                      color: brandColor == Colors.black
                          ? AppColors.textPrimary
                          : brandColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.paddingMd),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand Name & Category Tag
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.brandName.toUpperCase(),
                        style: AppTypography.heroSmallBadge.copyWith(
                          color: AppColors.primaryPurple,
                          fontSize: 10.0,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            size: 14.0,
                            color: AppColors.accentGold,
                          ),
                          const SizedBox(width: 2.0),
                          Text(
                            '${product.rating} (${product.reviewCount})',
                            style: AppTypography.cardSubtitle.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 2.0),

                  // Product Title
                  Text(
                    product.name,
                    style: AppTypography.cardTitle.copyWith(fontSize: 15.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),

                  // Full Retail Price
                  Text(
                    '₹${product.basePrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                    style: AppTypography.cardSubtitle.copyWith(
                      fontSize: 12.0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 6.0),

                  // Starting EMI Badge
                  if (lowestPlan != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.pillTabContainer,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.bolt_rounded,
                            size: 14.0,
                            color: AppColors.primaryPurple,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            'Starts at ₹${lowestPlan.monthlyAmount.toStringAsFixed(0)}/mo',
                            style: const TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primaryPurple,
                            ),
                          ),
                        ],
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
