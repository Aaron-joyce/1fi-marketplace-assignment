import 'package:flutter/widgets.dart';
import 'emi_plan_model.dart';
import 'product_variant_model.dart';

class ProductModel {
  final String id;
  final String name;
  final String brandName;
  final String brandWordmark;
  final String brandColorKey;
  final String category;
  final double basePrice;
  final IconData iconData;
  final String description;
  final List<String> highlights;
  final List<ProductVariantModel> variants;
  final List<EmiPlanModel> emiPlans;
  final double rating;
  final int reviewCount;

  const ProductModel({
    required this.id,
    required this.name,
    required this.brandName,
    required this.brandWordmark,
    required this.brandColorKey,
    required this.category,
    required this.basePrice,
    required this.iconData,
    required this.description,
    required this.highlights,
    required this.variants,
    required this.emiPlans,
    this.rating = 4.8,
    this.reviewCount = 142,
  });

  EmiPlanModel? get lowestMonthlyPlan {
    if (emiPlans.isEmpty) return null;
    return emiPlans.reduce((curr, next) =>
        curr.monthlyAmount < next.monthlyAmount ? curr : next);
  }
}
