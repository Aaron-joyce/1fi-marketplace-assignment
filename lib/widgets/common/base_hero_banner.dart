import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_decorations.dart';
import '../../core/constants/app_spacing.dart';

class BaseHeroBanner extends StatelessWidget {
  final Widget? topBadge;
  final Widget headline;
  final String subtitle;
  final Widget? bottomContent;
  final bool isFullBleed;
  final LinearGradient? gradient;

  const BaseHeroBanner({
    super.key,
    this.topBadge,
    required this.headline,
    required this.subtitle,
    this.bottomContent,
    this.isFullBleed = false,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = isFullBleed
        ? MediaQuery.of(context).padding.top + AppSpacing.paddingMd
        : AppSpacing.paddingLg;

    final margin = isFullBleed
        ? EdgeInsets.zero
        : const EdgeInsets.all(AppSpacing.paddingMd);

    final borderRadius = isFullBleed
        ? BorderRadius.zero
        : AppSpacing.borderRadiusCard;

    return Container(
      width: double.infinity,
      margin: margin,
      padding: EdgeInsets.only(
        top: topPadding,
        left: AppSpacing.paddingLg,
        right: AppSpacing.paddingLg,
        bottom: AppSpacing.paddingXl,
      ),
      decoration: BoxDecoration(
        gradient: gradient ?? AppDecorations.heroPurpleGradient,
        borderRadius: borderRadius,
        boxShadow: isFullBleed ? null : AppDecorations.softShadow,
      ),
      child: Stack(
        children: [
          // Background Sparkle Graphic
          Positioned(
            right: -10,
            top: 10,
            child: Opacity(
              opacity: 0.12,
              child: const Icon(
                Icons.auto_awesome,
                size: 130,
                color: AppColors.accentGold,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (topBadge != null) ...[
                topBadge!,
                const SizedBox(height: AppSpacing.paddingSm),
              ],
              headline,
              const SizedBox(height: AppSpacing.paddingSm),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFE2DBF7),
                  height: 1.35,
                ),
              ),
              if (bottomContent != null) ...[
                const SizedBox(height: AppSpacing.paddingLg),
                bottomContent!,
              ],
            ],
          ),
        ],
      ),
    );
  }
}
