import 'package:flutter/material.dart';
import '../models/emi_plan_model.dart';
import '../models/product_model.dart';
import '../models/product_variant_model.dart';

class MarketplaceService {
  final bool simulateError;

  const MarketplaceService({this.simulateError = false});

  Future<List<ProductModel>> fetchProducts({
    String category = 'All',
    String searchQuery = '',
  }) async {
    await Future.delayed(const Duration(milliseconds: 350));

    if (simulateError) {
      throw Exception('Failed to connect to 1Fi Marketplace API. Please try again.');
    }

    List<ProductModel> products = _allProducts;

    if (category != 'All') {
      products = products
          .where((p) => p.category.toLowerCase() == category.toLowerCase())
          .toList();
    }

    if (searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      products = products.where((p) {
        return p.name.toLowerCase().contains(query) ||
            p.brandName.toLowerCase().contains(query) ||
            p.category.toLowerCase().contains(query);
      }).toList();
    }

    return products;
  }

  static const List<ProductModel> _allProducts = [
    ProductModel(
      id: 'p1',
      name: 'iPhone 15 Pro Max',
      brandName: 'Apple',
      brandWordmark: 'APPLE',
      brandColorKey: 'apple',
      category: 'Smartphones',
      basePrice: 134900,
      iconData: Icons.phone_iphone_rounded,
      rating: 4.9,
      reviewCount: 320,
      description:
          'iPhone 15 Pro Max is forged in titanium and features the groundbreaking A17 Pro chip, a customizable Action button, and the most powerful iPhone camera system ever.',
      highlights: [
        'Aerospace-grade titanium design with textured matte glass back',
        'A17 Pro chip with 6-core GPU for next-level gaming',
        '48MP Main camera with multiple focal lengths & 5x Telephoto',
        'Customizable Action button to fast-track your favorite feature',
      ],
      variants: [
        ProductVariantModel(id: 'v1', name: '256 GB - Natural Titanium', priceOffset: 0),
        ProductVariantModel(id: 'v2', name: '512 GB - Black Titanium', priceOffset: 20000),
        ProductVariantModel(id: 'v3', name: '1 TB - Blue Titanium', priceOffset: 40000),
      ],
      emiPlans: [
        EmiPlanModel(
          id: 'emi_6',
          tenureMonths: 6,
          monthlyAmount: 22483,
          interestRate: 0.0,
          processingFee: 0,
          tag: '0% INTEREST',
        ),
        EmiPlanModel(
          id: 'emi_12',
          tenureMonths: 12,
          monthlyAmount: 11241,
          interestRate: 0.0,
          processingFee: 0,
          isRecommended: true,
          tag: 'MOST POPULAR',
        ),
        EmiPlanModel(
          id: 'emi_18',
          tenureMonths: 18,
          monthlyAmount: 7494,
          interestRate: 0.0,
          processingFee: 0,
          tag: 'NO-COST EMI',
        ),
        EmiPlanModel(
          id: 'emi_24',
          tenureMonths: 24,
          monthlyAmount: 5620,
          interestRate: 0.0,
          processingFee: 0,
          tag: 'LOWEST EMI',
        ),
      ],
    ),
    ProductModel(
      id: 'p2',
      name: 'MacBook Air M3',
      brandName: 'Apple',
      brandWordmark: 'APPLE',
      brandColorKey: 'apple',
      category: 'Laptops',
      basePrice: 114900,
      iconData: Icons.laptop_mac_rounded,
      rating: 4.8,
      reviewCount: 215,
      description:
          'Supercharged by the next-generation M3 chip, the strikingly thin MacBook Air combines incredible performance and up to 18 hours of battery life.',
      highlights: [
        'Apple M3 chip with 8-core CPU and 10-core GPU',
        '13.6-inch Liquid Retina display with 500 nits brightness',
        'Up to 18 hours battery life with MagSafe charging port',
        'Silent, fanless design in sleek Midnight aluminum',
      ],
      variants: [
        ProductVariantModel(id: 'v4', name: '8GB RAM / 256GB SSD - Midnight', priceOffset: 0),
        ProductVariantModel(id: 'v5', name: '16GB RAM / 512GB SSD - Starlight', priceOffset: 20000),
      ],
      emiPlans: [
        EmiPlanModel(
          id: 'emi_m3_6',
          tenureMonths: 6,
          monthlyAmount: 19150,
          interestRate: 0.0,
          tag: '0% INTEREST',
        ),
        EmiPlanModel(
          id: 'emi_m3_12',
          tenureMonths: 12,
          monthlyAmount: 9575,
          interestRate: 0.0,
          isRecommended: true,
          tag: 'BEST VALUE',
        ),
        EmiPlanModel(
          id: 'emi_m3_18',
          tenureMonths: 18,
          monthlyAmount: 6383,
          interestRate: 0.0,
          tag: 'NO-COST EMI',
        ),
      ],
    ),
    ProductModel(
      id: 'p3',
      name: 'Sony WH-1000XM5',
      brandName: 'Sony',
      brandWordmark: 'SONY',
      brandColorKey: 'sony',
      category: 'Audio',
      basePrice: 29990,
      iconData: Icons.headphones_rounded,
      rating: 4.7,
      reviewCount: 450,
      description:
          'Industry-leading noise canceling headphones with two processors, 8 microphones, and ultra-comfortable lightweight design.',
      highlights: [
        'Industry-leading HD Noise Canceling Processor QN1',
        '30-hour battery life with quick charging (3 min for 3 hours)',
        'Crystal clear hands-free calling with 4 beamforming mics',
        'Speak-to-Chat technology automatically pauses music during talk',
      ],
      variants: [
        ProductVariantModel(id: 'v6', name: 'Black', priceOffset: 0),
        ProductVariantModel(id: 'v7', name: 'Silver', priceOffset: 0),
        ProductVariantModel(id: 'v8', name: 'Midnight Blue', priceOffset: 1000),
      ],
      emiPlans: [
        EmiPlanModel(
          id: 'emi_sony_3',
          tenureMonths: 3,
          monthlyAmount: 9996,
          interestRate: 0.0,
          tag: '3 MONTHS 0%',
        ),
        EmiPlanModel(
          id: 'emi_sony_6',
          tenureMonths: 6,
          monthlyAmount: 4998,
          interestRate: 0.0,
          isRecommended: true,
          tag: 'NO-COST EMI',
        ),
        EmiPlanModel(
          id: 'emi_sony_12',
          tenureMonths: 12,
          monthlyAmount: 2499,
          interestRate: 0.0,
          tag: 'BUDGET FRIENDLY',
        ),
      ],
    ),
    ProductModel(
      id: 'p4',
      name: 'Galaxy S24 Ultra',
      brandName: 'Samsung',
      brandWordmark: 'SAMSUNG',
      brandColorKey: 'samsung',
      category: 'Smartphones',
      basePrice: 129999,
      iconData: Icons.smartphone_rounded,
      rating: 4.8,
      reviewCount: 188,
      description:
          'Welcome to the era of mobile AI. With Galaxy S24 Ultra in your hands, unleash whole new levels of creativity, productivity, and possibility.',
      highlights: [
        'Built-in S Pen & Armor Aluminum / Titanium Frame',
        'Circle to Search with Google & Live Translate features',
        '200MP Quad Tele Photo Camera with ProVisual Engine',
        'Snapdragon 8 Gen 3 for Galaxy processor',
      ],
      variants: [
        ProductVariantModel(id: 'v9', name: '256 GB - Titanium Gray', priceOffset: 0),
        ProductVariantModel(id: 'v10', name: '512 GB - Titanium Black', priceOffset: 15000),
      ],
      emiPlans: [
        EmiPlanModel(
          id: 'emi_s24_6',
          tenureMonths: 6,
          monthlyAmount: 21666,
          interestRate: 0.0,
          tag: '0% INTEREST',
        ),
        EmiPlanModel(
          id: 'emi_s24_12',
          tenureMonths: 12,
          monthlyAmount: 10833,
          interestRate: 0.0,
          isRecommended: true,
          tag: 'NO-COST EMI',
        ),
      ],
    ),
    ProductModel(
      id: 'p5',
      name: 'Apple Watch Ultra 2',
      brandName: 'Apple',
      brandWordmark: 'APPLE',
      brandColorKey: 'apple',
      category: 'Wearables',
      basePrice: 89900,
      iconData: Icons.watch_rounded,
      rating: 4.9,
      reviewCount: 96,
      description:
          'The ultimate sports and adventure watch. Featuring a lightweight titanium case, extra-long battery life, and the brightest Apple display ever.',
      highlights: [
        '49mm corrosion-resistant titanium case with 100m water resistance',
        'Brightest Always-On Retina display at 3000 nits',
        'S9 SiP chip with Double Tap gesture control',
        'Precision dual-frequency GPS for exact route calculation',
      ],
      variants: [
        ProductVariantModel(id: 'v11', name: 'Titanium Case - Indigo Alpine Loop', priceOffset: 0),
        ProductVariantModel(id: 'v12', name: 'Titanium Case - Ocean Band Blue', priceOffset: 0),
      ],
      emiPlans: [
        EmiPlanModel(
          id: 'emi_watch_6',
          tenureMonths: 6,
          monthlyAmount: 14983,
          interestRate: 0.0,
          tag: '0% INTEREST',
        ),
        EmiPlanModel(
          id: 'emi_watch_12',
          tenureMonths: 12,
          monthlyAmount: 7491,
          interestRate: 0.0,
          isRecommended: true,
          tag: 'NO-COST EMI',
        ),
      ],
    ),
  ];
}
