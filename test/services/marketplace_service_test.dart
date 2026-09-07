import 'package:flutter_test/flutter_test.dart';
import 'package:onefi_assignment_application/services/marketplace_service.dart';

void main() {
  group('MarketplaceService Unit Tests', () {
    late MarketplaceService service;

    setUp(() {
      service = const MarketplaceService();
    });

    test('fetchProducts returns all products when no filters applied', () async {
      final products = await service.fetchProducts();

      expect(products.isNotEmpty, isTrue);
      expect(products.length, greaterThanOrEqualTo(5));
    });

    test('fetchProducts filters correctly by category', () async {
      final audioProducts = await service.fetchProducts(category: 'Audio');

      expect(audioProducts.length, equals(1));
      expect(audioProducts.first.name, contains('Sony WH-1000XM5'));
    });

    test('fetchProducts filters correctly by search query', () async {
      final searchResults = await service.fetchProducts(searchQuery: 'MacBook');

      expect(searchResults.length, equals(1));
      expect(searchResults.first.name, equals('MacBook Air M3'));
    });

    test('fetchProducts throws exception when simulateError is true', () async {
      const errorService = MarketplaceService(simulateError: true);

      expect(
        () async => await errorService.fetchProducts(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
