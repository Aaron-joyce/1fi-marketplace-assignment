import 'package:flutter/material.dart';
import '../core/constants/app_spacing.dart';
import '../models/brand_model.dart';
import '../models/offer_model.dart';
import '../repositories/brand_repository.dart';
import '../repositories/offer_repository.dart';
import '../widgets/common/section_header.dart';
import '../widgets/home/benefit_cards_row.dart';
import '../widgets/home/home_hero_banner.dart';
import '../widgets/home/offer_carousel.dart';
import '../widgets/home/top_brands_horizontal_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Cached data lists initialized once outside build()
  static final List<OfferModel> _offers = OfferRepository.getHomeOffers();
  static final List<BrandModel> _horizontalBrands = BrandRepository.getHomeHorizontalBrands();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            // Hero Banner Card
            const HomeHeroBanner(),

            // OFFERS Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.paddingMd),
              child: SectionHeader(title: 'OFFERS'),
            ),
            const SizedBox(height: AppSpacing.paddingSm),
            OfferCarousel(offers: _offers),

            const SizedBox(height: AppSpacing.paddingLg),

            // SHOP USING 1FI AT TOP BRANDS Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.paddingMd),
              child: SectionHeader(title: 'SHOP USING 1FI AT TOP BRANDS'),
            ),
            const SizedBox(height: AppSpacing.paddingSm),
            TopBrandsHorizontalList(brands: _horizontalBrands),

            const SizedBox(height: AppSpacing.paddingLg),

            // WHY PAY WITH 1FI Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.paddingMd),
              child: SectionHeader(title: 'WHY PAY WITH 1FI'),
            ),
            const SizedBox(height: AppSpacing.paddingSm),
            const BenefitCardsRow(),

            // Bottom Spacing for floating navbar
            const SizedBox(height: AppSpacing.bottomNavSpacer),
          ],
        ),
      ),
    );
  }
}
