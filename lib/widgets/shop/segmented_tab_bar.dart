import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';

class SegmentedTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const SegmentedTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  static const List<String> _tabs = [
    'Top Brands',
    'Nearby Stores',
    '1Fi Marketplace',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.paddingMd,
        vertical: AppSpacing.paddingSm,
      ),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: AppColors.pillTabContainer,
        borderRadius: AppSpacing.borderRadiusPill,
      ),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          final isSelected = index == selectedIndex;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.pillTabSelected : Colors.transparent,
                  borderRadius: AppSpacing.borderRadiusPill,
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : null,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _tabs[index],
                      textAlign: TextAlign.center,
                      style: isSelected
                          ? AppTypography.tabSelected
                          : AppTypography.tabUnselected,
                    ),
                    if (isSelected) ...[
                      const SizedBox(height: 4.0),
                      Container(
                        width: 24.0,
                        height: 2.5,
                        decoration: BoxDecoration(
                          color: AppColors.primaryPurple,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
