import 'package:flutter/foundation.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentBottomNavIndex = 1; // Default to Shop screen (index 1) as requested, or Home (0)
  int _currentShopTabIndex = 0; // 0: Top Brands, 1: Nearby Stores, 2: 1Fi Marketplace

  int get currentBottomNavIndex => _currentBottomNavIndex;
  int get currentShopTabIndex => _currentShopTabIndex;

  void setBottomNavIndex(int index) {
    if (_currentBottomNavIndex != index) {
      _currentBottomNavIndex = index;
      notifyListeners();
    }
  }

  void setShopTabIndex(int index) {
    if (_currentShopTabIndex != index) {
      _currentShopTabIndex = index;
      notifyListeners();
    }
  }
}
