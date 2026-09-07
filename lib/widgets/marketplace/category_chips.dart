import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';

class CategoryChips extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryChips({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  static const List<String> _categories = [
    'All',
    'Smartphones',
    'Laptops',
    'Audio',
    'Wearables',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.0,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingMd),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8.0),
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == selectedCategory;

          return GestureDetector(
            onTap: () => onCategorySelected(category),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryPurple : AppColors.cardBackground,
                borderRadius: AppSpacing.borderRadiusPill,
                border: Border.all(
                  color: isSelected ? AppColors.primaryPurple : Colors.grey.shade300,
                  width: 1.0,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppColors.primaryPurple.withValues(alpha: 0.25),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        )
                      ]
                    : null,
              ),
              child: Text(
                category,
                style: AppTypography.cardSubtitle.copyWith(
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  fontSize: 13.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
