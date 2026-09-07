import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_spacing.dart';
import '../core/constants/app_typography.dart';
import '../providers/navigation_provider.dart';
import '../repositories/brand_repository.dart';
import '../widgets/common/brand_list_item_card.dart';
import '../widgets/shop/segmented_tab_bar.dart';
import '../widgets/shop/shop_hero_banner.dart';
import '../widgets/shop/shop_search_bar.dart';
import 'marketplace/marketplace_tab_view.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Banner Card with purple gradient & graphics
            const ShopHeroBanner(),

            // Segmented Pill Tab Bar (Top Brands | Nearby Stores | 1Fi Marketplace)
            SegmentedTabBar(
              selectedIndex: navProvider.currentShopTabIndex,
              onTabSelected: (index) {
                navProvider.setShopTabIndex(index);
              },
            ),

            // Tab View Body
            _buildTabContent(context, navProvider.currentShopTabIndex),

            // Bottom Spacing for floating navbar
            const SizedBox(height: AppSpacing.bottomNavSpacer),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(BuildContext context, int tabIndex) {
    switch (tabIndex) {
      case 0:
        // Top Brands View with Responsive LayoutBuilder Breakpoint
        final sampleBrands = BrandRepository.getShopTopBrands();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            const ShopSearchBar(),
            const SizedBox(height: AppSpacing.paddingSm),

            // Section Header Title "Top Brands"
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.paddingMd,
                vertical: AppSpacing.paddingSm,
              ),
              child: Text(
                'Top Brands',
                style: AppTypography.titleLarge,
              ),
            ),

            // Responsive Brand Cards Grid / List
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 600;

                if (isWide) {
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingMd),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.8,
                      crossAxisSpacing: AppSpacing.paddingMd,
                      mainAxisSpacing: AppSpacing.paddingSm,
                    ),
                    itemCount: sampleBrands.length,
                    itemBuilder: (context, index) {
                      return BrandListItemCard(brand: sampleBrands[index]);
                    },
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingMd),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: sampleBrands.length,
                    itemBuilder: (context, index) {
                      return BrandListItemCard(brand: sampleBrands[index]);
                    },
                  );
                }
              },
            ),
          ],
        );
      case 1:
        // Nearby Stores Placeholder View
        return const Padding(
          padding: EdgeInsets.all(AppSpacing.paddingXl * 2),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.store_mall_directory_outlined,
                  size: 48,
                  color: Colors.grey,
                ),
                SizedBox(height: AppSpacing.paddingMd),
                Text(
                  'Nearby Stores',
                  style: AppTypography.cardTitle,
                ),
                SizedBox(height: AppSpacing.paddingSm),
                Text(
                  'No partner stores found nearby. Enable location services to view local stores.',
                  style: AppTypography.cardSubtitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      case 2:
        // 1Fi Marketplace Active View
        return const MarketplaceTabView();
      default:
        return const SizedBox.shrink();
    }
  }
}
