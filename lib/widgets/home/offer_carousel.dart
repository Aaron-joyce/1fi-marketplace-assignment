import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_decorations.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../../models/offer_model.dart';

class OfferCarousel extends StatefulWidget {
  final List<OfferModel> offers;

  const OfferCarousel({
    super.key,
    required this.offers,
  });

  @override
  State<OfferCarousel> createState() => _OfferCarouselState();
}

class _OfferCarouselState extends State<OfferCarousel> {
  int _activePage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180.0,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.offers.length,
            onPageChanged: (index) {
              setState(() {
                _activePage = index;
              });
            },
            itemBuilder: (context, index) {
              final offer = widget.offers[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingMd),
                padding: const EdgeInsets.all(AppSpacing.paddingLg),
                decoration: BoxDecoration(
                  borderRadius: AppSpacing.borderRadiusCard,
                  boxShadow: AppDecorations.softShadow,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8E3B27), Color(0xFFC75B39), Color(0xFF1B4965)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Tag & Partner Logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          offer.categoryTag.toUpperCase(),
                          style: AppTypography.sectionHeader.copyWith(
                            color: AppColors.accentGold,
                            fontSize: 11.0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            offer.partnerLogoText,
                            style: const TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w900,
                              color: AppColors.brandMakeMyTrip,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Title
                    Text(
                      offer.title,
                      style: AppTypography.cardTitle.copyWith(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    // Monthly Price Pill Tag
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 6.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 14.0,
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            offer.priceTag,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12.0),
        // Pagination indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.offers.length, (index) {
            final isSelected = index == _activePage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              width: isSelected ? 18.0 : 7.0,
              height: 7.0,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryPurple : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4.0),
              ),
            );
          }),
        ),
      ],
    );
  }
}
