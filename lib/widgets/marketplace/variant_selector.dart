import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../../models/product_variant_model.dart';

class VariantSelector extends StatelessWidget {
  final List<ProductVariantModel> variants;
  final ProductVariantModel? selectedVariant;
  final ValueChanged<ProductVariantModel> onVariantSelected;

  const VariantSelector({
    super.key,
    required this.variants,
    required this.selectedVariant,
    required this.onVariantSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SELECT VARIANT',
          style: AppTypography.sectionHeader,
        ),
        const SizedBox(height: AppSpacing.paddingSm),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: variants.map((variant) {
            final isSelected = selectedVariant?.id == variant.id;

            return GestureDetector(
              onTap: () => onVariantSelected(variant),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.pillTabContainer
                      : AppColors.cardBackground,
                  borderRadius: AppSpacing.borderRadiusSmall,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryPurple
                        : Colors.grey.shade300,
                    width: isSelected ? 1.5 : 1.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSelected)
                      const Padding(
                        padding: EdgeInsets.only(right: 6.0),
                        child: Icon(
                          Icons.check_circle_rounded,
                          size: 14.0,
                          color: AppColors.primaryPurple,
                        ),
                      ),
                    Text(
                      variant.name,
                      style: AppTypography.cardSubtitle.copyWith(
                        color: isSelected
                            ? AppColors.primaryPurple
                            : AppColors.textPrimary,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                        fontSize: 12.5,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
