import 'package:flutter_test/flutter_test.dart';
import 'package:onefi_assignment_application/providers/marketplace_provider.dart';
import 'package:onefi_assignment_application/services/marketplace_service.dart';

void main() {
  group('MarketplaceProvider Unit Tests', () {
    late MarketplaceProvider provider;

    setUp(() {
      provider = MarketplaceProvider();
    });

    test('Initial state fetches products and populates list', () async {
      expect(provider.isLoading, isTrue);

      await Future.delayed(const Duration(milliseconds: 400));

      expect(provider.isLoading, isFalse);
      expect(provider.errorMessage, isNull);
      expect(provider.products.isNotEmpty, isTrue);
    });

    test('setCategory updates category and re-fetches products', () async {
      await Future.delayed(const Duration(milliseconds: 400));

      provider.setCategory('Smartphones');

      expect(provider.selectedCategory, equals('Smartphones'));
      expect(provider.isLoading, isTrue);

      await Future.delayed(const Duration(milliseconds: 400));

      expect(provider.products.every((p) => p.category == 'Smartphones'), isTrue);
    });

    test('Race condition guard discards older out-of-order fetch results', () async {
      await Future.delayed(const Duration(milliseconds: 400));

      // Trigger first fetch
      provider.setCategory('Audio');
      // Immediately trigger second fetch before first completes
      provider.setCategory('Wearables');

      await Future.delayed(const Duration(milliseconds: 400));

      // Final state should strictly reflect second fetch ('Wearables'), not 'Audio'
      expect(provider.selectedCategory, equals('Wearables'));
      expect(provider.products.every((p) => p.category == 'Wearables'), isTrue);
    });

    test('selectProduct initializes variant and recommended EMI plan', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final firstProduct = provider.products.first;

      provider.selectProduct(firstProduct);

      expect(provider.selectedProduct, equals(firstProduct));
      expect(provider.selectedVariant, equals(firstProduct.variants.first));
      expect(provider.selectedEmiPlan, isNotNull);
      expect(provider.calculatedTotalPrice, greaterThan(0));
    });

    test('selectVariant updates calculated total price offset', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      final iphone = provider.products.firstWhere((p) => p.name.contains('iPhone'));

      provider.selectProduct(iphone);
      final basePrice = provider.calculatedTotalPrice;

      final higherVariant = iphone.variants[1]; // +20,000
      provider.selectVariant(higherVariant);

      expect(provider.calculatedTotalPrice, equals(basePrice + higherVariant.priceOffset));
    });

    test('Error state is set when service fails', () async {
      const failingService = MarketplaceService(simulateError: true);
      final failingProvider = MarketplaceProvider(service: failingService);

      await Future.delayed(const Duration(milliseconds: 400));

      expect(failingProvider.isLoading, isFalse);
      expect(failingProvider.errorMessage, isNotNull);
      expect(failingProvider.products.isEmpty, isTrue);
    });

    test('confirmCheckout & resetCheckoutState work correctly', () async {
      await Future.delayed(const Duration(milliseconds: 400));
      provider.selectProduct(provider.products.first);

      provider.confirmCheckout();
      expect(provider.isCheckoutSuccess, isTrue);

      provider.resetCheckoutState();
      expect(provider.isCheckoutSuccess, isFalse);
      expect(provider.selectedProduct, isNull);
    });
  });
}
