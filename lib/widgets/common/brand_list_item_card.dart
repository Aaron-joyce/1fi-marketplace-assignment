import 'package:flutter/material.dart';
import '../../core/constants/app_decorations.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../../models/brand_model.dart';

class BrandListItemCard extends StatelessWidget {
  final BrandModel brand;
  final VoidCallback? onTap;

  const BrandListItemCard({
    super.key,
    required this.brand,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.paddingMd),
        padding: const EdgeInsets.all(AppSpacing.paddingMd),
        decoration: AppDecorations.cardDecoration,
        child: Row(
          children: [
            // Solid background logo container with wordmark text
            Container(
              width: AppSpacing.brandLogoSize,
              height: AppSpacing.brandLogoSize,
              decoration: BoxDecoration(
                color: brand.backgroundColor,
                borderRadius: AppSpacing.borderRadiusLogo,
              ),
              padding: const EdgeInsets.all(AppSpacing.paddingXs),
              alignment: Alignment.center,
              child: Text(
                brand.wordmark,
                textAlign: TextAlign.center,
                style: AppTypography.brandWordmark,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: AppSpacing.paddingMd),
            // Title and subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brand.name,
                    style: AppTypography.cardTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    brand.subtitle,
                    style: AppTypography.cardSubtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
