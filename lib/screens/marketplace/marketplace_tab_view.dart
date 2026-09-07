import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../../providers/marketplace_provider.dart';
import '../../widgets/marketplace/category_chips.dart';
import '../../widgets/marketplace/product_card.dart';
import '../../widgets/shop/shop_search_bar.dart';
import 'product_detail_modal.dart';

class MarketplaceTabView extends StatelessWidget {
  const MarketplaceTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MarketplaceProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Live Product Search Input with Debounce
        ShopSearchBar(
          onChanged: (query) {
            provider.setSearchQuery(query);
          },
        ),

        const SizedBox(height: AppSpacing.paddingSm),

        // Category Filter Chips
        CategoryChips(
          selectedCategory: provider.selectedCategory,
          onCategorySelected: (category) {
            provider.setCategory(category);
          },
        ),

        const SizedBox(height: AppSpacing.paddingMd),

        // Section Title & Item Counter
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingMd),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                provider.selectedCategory == 'All'
                    ? 'Featured Products'
                    : '${provider.selectedCategory} Products',
                style: AppTypography.titleLarge,
              ),
              if (!provider.isLoading && provider.errorMessage == null)
                Text(
                  '${provider.products.length} Items',
                  style: AppTypography.cardSubtitle,
                ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.paddingSm),

        // 1. Loading State View
        if (provider.isLoading)
          const Padding(
            padding: EdgeInsets.all(AppSpacing.paddingXl * 2),
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryPurple,
              ),
            ),
          )

        // 2. Error State View with Retry Button
        else if (provider.errorMessage != null)
          Padding(
            padding: const EdgeInsets.all(AppSpacing.paddingXl),
            child: Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.error_outline_rounded,
                    size: 48,
                    color: Colors.redAccent,
                  ),
                  const SizedBox(height: AppSpacing.paddingMd),
                  Text(
                    'Failed to Load Products',
                    style: AppTypography.cardTitle.copyWith(color: Colors.redAccent),
                  ),
                  const SizedBox(height: AppSpacing.paddingSm),
                  Text(
                    provider.errorMessage!,
                    style: AppTypography.cardSubtitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.paddingLg),
                  ElevatedButton.icon(
                    onPressed: () => provider.fetchProducts(),
                    icon: const Icon(Icons.refresh_rounded, size: 18.0),
                    label: const Text('Retry'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: AppSpacing.borderRadiusPill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )

        // 3. Empty Search / Category Results View
        else if (provider.products.isEmpty)
          Padding(
            padding: const EdgeInsets.all(AppSpacing.paddingXl * 2),
            child: Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.search_off_rounded,
                    size: 48,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: AppSpacing.paddingMd),
                  const Text(
                    'No Products Found',
                    style: AppTypography.cardTitle,
                  ),
                  const SizedBox(height: AppSpacing.paddingSm),
                  Text(
                    'Try adjusting your search query or category filter.',
                    style: AppTypography.cardSubtitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )

        // 4. Product Catalog Listing with Tablet / Landscape Grid Breakpoint
        else
          LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 600;

              if (isWideScreen) {
                // Responsive Grid for Tablet / Landscape Screens
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingMd),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.2,
                    crossAxisSpacing: AppSpacing.paddingMd,
                    mainAxisSpacing: AppSpacing.paddingSm,
                  ),
                  itemCount: provider.products.length,
                  itemBuilder: (context, index) {
                    final product = provider.products[index];
                    return ProductCard(
                      product: product,
                      onTap: () => _openProductDetail(context, provider, product),
                    );
                  },
                );
              } else {
                // Mobile Vertical List
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingMd),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.products.length,
                  itemBuilder: (context, index) {
                    final product = provider.products[index];
                    return ProductCard(
                      product: product,
                      onTap: () => _openProductDetail(context, provider, product),
                    );
                  },
                );
              }
            },
          ),
      ],
    );
  }

  void _openProductDetail(
    BuildContext context,
    MarketplaceProvider provider,
    dynamic product,
  ) {
    provider.selectProduct(product);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ProductDetailModal(product: product),
    );
  }
}
