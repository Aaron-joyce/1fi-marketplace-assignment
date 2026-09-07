import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_decorations.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';

class FloatingBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const FloatingBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const List<_NavItemData> _items = [
    _NavItemData(icon: Icons.home_rounded, label: 'Home'),
    _NavItemData(icon: Icons.storefront_rounded, label: 'Shop'),
    _NavItemData(icon: Icons.receipt_long_outlined, label: 'EMI Dues'),
    _NavItemData(icon: Icons.show_chart_rounded, label: 'Limit'),
    _NavItemData(icon: Icons.person_outline_rounded, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 68.0,
        margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingMd,
          vertical: AppSpacing.paddingSm,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(34.0),
          boxShadow: AppDecorations.navBarShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (index) {
            final isSelected = index == currentIndex;
            final item = _items[index];

            return Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                borderRadius: BorderRadius.circular(34.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Active Top Indicator Bar
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: isSelected ? 22.0 : 0.0,
                      height: 3.0,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.navActive : Colors.transparent,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    // Icon with optional soft purple glow container when active
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: isSelected
                          ? BoxDecoration(
                              color: AppColors.navGlow,
                              shape: BoxShape.circle,
                            )
                          : null,
                      child: Icon(
                        item.icon,
                        size: 22.0,
                        color: isSelected ? AppColors.navActive : AppColors.navInactive,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    // Label
                    Text(
                      item.label,
                      style: AppTypography.navItem.copyWith(
                        color: isSelected ? AppColors.navActive : AppColors.navInactive,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final String label;

  const _NavItemData({required this.icon, required this.label});
}
