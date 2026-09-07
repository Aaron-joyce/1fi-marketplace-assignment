import 'package:flutter_test/flutter_test.dart';
import 'package:onefi_assignment_application/providers/navigation_provider.dart';

void main() {
  group('NavigationProvider Unit Tests', () {
    late NavigationProvider navigationProvider;

    setUp(() {
      navigationProvider = NavigationProvider();
    });

    test('Initial bottom nav index defaults to Shop tab (1)', () {
      expect(navigationProvider.currentBottomNavIndex, equals(1));
    });

    test('Initial Shop tab index defaults to Top Brands (0)', () {
      expect(navigationProvider.currentShopTabIndex, equals(0));
    });

    test('setBottomNavIndex updates index and notifies listeners', () {
      var listenerCalled = false;
      navigationProvider.addListener(() {
        listenerCalled = true;
      });

      navigationProvider.setBottomNavIndex(0); // Switch to Home

      expect(navigationProvider.currentBottomNavIndex, equals(0));
      expect(listenerCalled, isTrue);
    });

    test('setShopTabIndex updates sub-tab index correctly', () {
      var listenerCalled = false;
      navigationProvider.addListener(() {
        listenerCalled = true;
      });

      navigationProvider.setShopTabIndex(2); // Switch to 1Fi Marketplace

      expect(navigationProvider.currentShopTabIndex, equals(2));
      expect(listenerCalled, isTrue);
    });
  });
}
