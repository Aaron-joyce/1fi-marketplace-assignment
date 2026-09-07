import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../common/base_hero_banner.dart';

class ShopHeroBanner extends StatelessWidget {
  const ShopHeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseHeroBanner(
      isFullBleed: true,
      topBadge: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 6.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.3),
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.auto_awesome,
              size: 14.0,
              color: Colors.white,
            ),
            SizedBox(width: 6.0),
            Text(
              'NO-COST EMIs',
              style: AppTypography.heroSmallBadge,
            ),
          ],
        ),
      ),
      headline: Row(
        children: [
          Expanded(
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Shop today,\n',
                    style: AppTypography.heroHeadlineBold,
                  ),
                  TextSpan(
                    text: 'Pay later ',
                    style: AppTypography.heroHeadlineItalic,
                  ),
                  TextSpan(
                    text: 'using\n',
                    style: AppTypography.heroHeadlineItalic,
                  ),
                  TextSpan(
                    text: 'Mutual funds.',
                    style: AppTypography.heroHeadlineBold,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 90,
            height: 90,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accentGold.withValues(alpha: 0.2),
                  ),
                ),
                const Icon(
                  Icons.shopping_bag_outlined,
                  size: 48,
                  color: AppColors.accentGold,
                ),
                const Positioned(
                  right: 2,
                  top: 2,
                  child: Icon(
                    Icons.directions_car_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      subtitle: 'No credit score required. No interest.\nBacked by your investments.',
    );
  }
}
