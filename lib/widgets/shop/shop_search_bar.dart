import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_decorations.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';

class ShopSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const ShopSearchBar({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.paddingMd,
        vertical: AppSpacing.paddingSm,
      ),
      decoration: BoxDecoration(
        color: AppColors.searchBackground,
        borderRadius: AppSpacing.borderRadiusPill,
        boxShadow: AppDecorations.softShadow,
      ),
      child: TextField(
        onChanged: onChanged,
        style: AppTypography.cardTitle.copyWith(fontSize: 14.0),
        decoration: InputDecoration(
          hintText: 'Search online stores...',
          hintStyle: AppTypography.searchPlaceholder,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 12.0),
            child: Icon(
              Icons.search_rounded,
              color: AppColors.textSecondary,
              size: 22.0,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 48,
            minHeight: 48,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14.0,
            horizontal: AppSpacing.paddingMd,
          ),
        ),
      ),
    );
  }
}
