import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  // Section Headers
  static const TextStyle sectionHeader = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w800,
    color: AppColors.textPurpleHeader,
    letterSpacing: 1.2,
  );

  // Hero Banner Text Styles
  static const TextStyle heroSmallBadge = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
    letterSpacing: 0.8,
  );

  static const TextStyle heroHeadlineBold = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w800,
    color: AppColors.textWhite,
    height: 1.15,
  );

  static const TextStyle heroHeadlineItalic = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: AppColors.textWhite,
    height: 1.15,
  );

  static const TextStyle heroSubtitle = TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w400,
    color: Color(0xFFE2DBF7),
    height: 1.35,
  );

  static const TextStyle heroCtaText = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // Section Main Titles (e.g. "Top Brands" title on Shop page)
  static const TextStyle titleLarge = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -0.2,
  );

  // Card Titles & Subtitles
  static const TextStyle cardTitle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // Tab Bar Typography
  static const TextStyle tabSelected = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryPurple,
  );

  static const TextStyle tabUnselected = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  // Search Bar
  static const TextStyle searchPlaceholder = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // Nav Bar
  static const TextStyle navItem = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w600,
  );

  // Brand Logo Text
  static const TextStyle brandWordmark = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w900,
    color: AppColors.textWhite,
    letterSpacing: -0.3,
  );
}
