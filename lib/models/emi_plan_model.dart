class EmiPlanModel {
  final String id;
  final int tenureMonths;
  final double monthlyAmount;
  final double interestRate;
  final double processingFee;
  final bool isRecommended;
  final String? tag;

  const EmiPlanModel({
    required this.id,
    required this.tenureMonths,
    required this.monthlyAmount,
    this.interestRate = 0.0,
    this.processingFee = 0.0,
    this.isRecommended = false,
    this.tag,
  });

  bool get isNoCost => interestRate == 0.0;
}
