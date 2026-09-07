import 'package:flutter/material.dart';

class AppColors {
  // Brand Gradients & Primary Colors
  static const Color primaryGradientStart = Color(0xFF4B2A9E);
  static const Color primaryGradientEnd = Color(0xFF2A1868);
  static const Color primaryPurple = Color(0xFF5A2B9C);
  static const Color darkIndigo = Color(0xFF231254);

  // Accent Colors
  static const Color accentGold = Color(0xFFF5C518);
  static const Color accentYellow = Color(0xFFFFD700);

  // Screen & Container Backgrounds
  static const Color screenBackground = Color(0xFFF5F5F6);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color pillTabContainer = Color(0xFFF0ECFB);
  static const Color pillTabSelected = Color(0xFFFFFFFF);
  static const Color searchBackground = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF1E1E24);
  static const Color textSecondary = Color(0xFF757580);
  static const Color textLightPurple = Color(0xFFD6C7FB);
  static const Color textPurpleHeader = Color(0xFF5A2B9C);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Nav Bar Colors
  static const Color navActive = Color(0xFF5A2B9C);
  static const Color navInactive = Color(0xFF8E8E93);
  static const Color navGlow = Color(0x1A5A2B9C);

  // Sample Brand Background Colors
  static const Color brandAirIndia = Color(0xFFE31837);
  static const Color brandApple = Color(0xFF1C1C1E);
  static const Color brandCaratLane = Color(0xFF8C2684);
  static const Color brandReliance = Color(0xFF003881);
  static const Color brandCroma = Color(0xFF00B3B0);
  static const Color brandVijaySales = Color(0xFFE2231A);
  static const Color brandMakeMyTrip = Color(0xFFEB2026);
  static const Color brandSamsung = Color(0xFF1428A0);
  static const Color brandSony = Color(0xFF000000);

  // Success / Status Colors
  static const Color successGreen = Color(0xFF2DBE76);
  static const Color successGreenLight = Color(0xFFE8F8F0);

  static Color getBrandColor(String key) {
    switch (key.toLowerCase()) {
      case 'air_india':
      case 'airindia':
        return brandAirIndia;
      case 'apple':
        return brandApple;
      case 'caratlane':
      case 'carat_lane':
        return brandCaratLane;
      case 'reliance':
      case 'reliance_digital':
        return brandReliance;
      case 'croma':
        return brandCroma;
      case 'vijaysales':
      case 'vijay_sales':
        return brandVijaySales;
      case 'makemytrip':
      case 'make_my_trip':
        return brandMakeMyTrip;
      case 'samsung':
        return brandSamsung;
      case 'sony':
        return brandSony;
      default:
        return primaryPurple;
    }
  }
}

/// Utility for parsing CSS-style hex color strings at runtime.
///
/// Supports:
///   '#RGB'       → 3-digit shorthand, e.g. '#F0A'
///   '#RRGGBB'    → 6-digit, e.g. '#2DBE76'
///   '#AARRGGBB'  → 8-digit with alpha, e.g. '#802DBE76'
///
/// Usage (non-const only):
///   final color = ColorUtils.fromHex('#2DBE76');
///   final translucent = ColorUtils.fromHex('#802DBE76');
///
/// Note: AppColors constants must remain as `const Color(0xFF...)` because
/// Dart requires compile-time constants for `static const` fields.
class ColorUtils {
  ColorUtils._();

  static Color fromHex(String hex) {
    final cleaned = hex.trim().replaceFirst('#', '');

    switch (cleaned.length) {
      case 3:
        // '#RGB' → '#RRGGBB'
        final r = cleaned[0] * 2;
        final g = cleaned[1] * 2;
        final b = cleaned[2] * 2;
        return Color(int.parse('ff$r$g$b', radix: 16));
      case 6:
        return Color(int.parse('ff$cleaned', radix: 16));
      case 8:
        return Color(int.parse(cleaned, radix: 16));
      default:
        throw ArgumentError('Invalid hex color: "$hex". Expected #RGB, #RRGGBB, or #AARRGGBB.');
    }
  }
}
