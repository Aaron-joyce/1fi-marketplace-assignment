import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';

class AppDecorations {
  // Hero Banner Diagonal Purple Gradient
  static const LinearGradient heroPurpleGradient = LinearGradient(
    colors: [
      AppColors.primaryGradientStart,
      AppColors.primaryGradientEnd,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Soft Card Shadow
  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 12,
      spreadRadius: 0,
      offset: const Offset(0, 4),
    ),
  ];

  // Floating Bottom Nav Bar Shadow
  static List<BoxShadow> navBarShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 20,
      spreadRadius: 2,
      offset: const Offset(0, 6),
    ),
  ];

  // Card Decoration
  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: AppSpacing.borderRadiusCard,
    boxShadow: softShadow,
  );
}
