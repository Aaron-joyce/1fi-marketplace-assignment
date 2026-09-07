class ProductVariantModel {
  final String id;
  final String name;
  final double priceOffset;

  const ProductVariantModel({
    required this.id,
    required this.name,
    this.priceOffset = 0.0,
  });
}
