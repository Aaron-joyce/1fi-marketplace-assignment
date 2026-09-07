import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../../models/brand_model.dart';

class TopBrandsHorizontalList extends StatelessWidget {
  final List<BrandModel> brands;

  const TopBrandsHorizontalList({
    super.key,
    required this.brands,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96.0,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingMd),
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        separatorBuilder: (context, index) => const SizedBox(width: 14.0),
        itemBuilder: (context, index) {
          final brand = brands[index];
          return SizedBox(
            width: 72.0,
            child: Column(
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: brand.backgroundColor,
                    borderRadius: AppSpacing.borderRadiusLogo,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    brand.wordmark,
                    textAlign: TextAlign.center,
                    style: AppTypography.brandWordmark.copyWith(
                      fontSize: 10.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  brand.name,
                  textAlign: TextAlign.center,
                  style: AppTypography.navItem.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 11.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
