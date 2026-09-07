import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_decorations.dart';
import '../core/constants/app_spacing.dart';
import '../core/constants/app_typography.dart';
import '../widgets/common/section_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + AppSpacing.paddingMd,
          left: AppSpacing.paddingMd,
          right: AppSpacing.paddingMd,
          bottom: AppSpacing.bottomNavSpacer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile',
              style: AppTypography.titleLarge,
            ),
            const SizedBox(height: AppSpacing.paddingMd),

            // Profile Header Card
            Container(
              padding: const EdgeInsets.all(AppSpacing.paddingLg),
              decoration: AppDecorations.cardDecoration,
              child: Row(
                children: [
                  Container(
                    width: 64.0,
                    height: 64.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryPurple,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'RS',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.paddingMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Rahul Sharma',
                          style: AppTypography.cardTitle,
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          '+91 98765 43210 • Verified',
                          style: AppTypography.cardSubtitle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.pillTabContainer,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit_outlined,
                      size: 18.0,
                      color: AppColors.primaryPurple,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.paddingLg),

            // ACCOUNT SETTINGS Section
            const SectionHeader(title: 'ACCOUNT SETTINGS'),
            const SizedBox(height: AppSpacing.paddingSm),

            _buildSettingTile(
              icon: Icons.account_balance_wallet_outlined,
              title: 'Mutual Fund Portfolio',
              subtitle: 'CAMS & KFintech linked',
            ),
            _buildSettingTile(
              icon: Icons.account_balance_outlined,
              title: 'Bank Auto-Debit (NACH)',
              subtitle: 'HDFC Bank ending in 4921',
            ),
            _buildSettingTile(
              icon: Icons.security_outlined,
              title: 'Security & App Lock',
              subtitle: 'Biometric & PIN enabled',
            ),
            _buildSettingTile(
              icon: Icons.help_outline_rounded,
              title: 'Help & Support',
              subtitle: 'Chat with 1Fi support 24x7',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.paddingSm),
      padding: const EdgeInsets.all(AppSpacing.paddingMd),
      decoration: AppDecorations.cardDecoration,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primaryPurple,
            size: 22.0,
          ),
          const SizedBox(width: AppSpacing.paddingMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.cardTitle.copyWith(fontSize: 14.0),
                ),
                const SizedBox(height: 2.0),
                Text(
                  subtitle,
                  style: AppTypography.cardSubtitle.copyWith(fontSize: 12.0),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
