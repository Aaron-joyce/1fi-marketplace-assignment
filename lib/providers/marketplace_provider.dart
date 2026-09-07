import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/emi_plan_model.dart';
import '../models/product_model.dart';
import '../models/product_variant_model.dart';
import '../services/marketplace_service.dart';

class MarketplaceProvider extends ChangeNotifier {
  final MarketplaceService _marketplaceService;

  List<ProductModel> _products = [];
  bool _isLoading = false;
  String? _errorMessage;
  String _selectedCategory = 'All';
  String _searchQuery = '';

  Timer? _debounceTimer;
  int _currentFetchId = 0;

  ProductModel? _selectedProduct;
  ProductVariantModel? _selectedVariant;
  EmiPlanModel? _selectedEmiPlan;
  bool _isCheckoutSuccess = false;

  // Getters
  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;

  ProductModel? get selectedProduct => _selectedProduct;
  ProductVariantModel? get selectedVariant => _selectedVariant;
  EmiPlanModel? get selectedEmiPlan => _selectedEmiPlan;
  bool get isCheckoutSuccess => _isCheckoutSuccess;

  // Constructor with optional service injection for testing
  MarketplaceProvider({MarketplaceService? service})
      : _marketplaceService = service ?? const MarketplaceService() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final fetchId = ++_currentFetchId;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final results = await _marketplaceService.fetchProducts(
        category: _selectedCategory,
        searchQuery: _searchQuery,
      );

      // Race-condition guard: Only update state if this is the latest fetch invocation
      if (fetchId == _currentFetchId) {
        _products = results;
      }
    } catch (e) {
      if (fetchId == _currentFetchId) {
        _errorMessage = e.toString().replaceAll('Exception: ', '');
        _products = [];
      }
    } finally {
      if (fetchId == _currentFetchId) {
        _isLoading = false;
        notifyListeners();
      }
    }
  }

  void setCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      fetchProducts();
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;

    // 300ms Search Debounce
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      fetchProducts();
    });
  }

  void selectProduct(ProductModel product) {
    _selectedProduct = product;
    _selectedVariant = product.variants.isNotEmpty ? product.variants.first : null;
    _selectedEmiPlan = product.emiPlans.isNotEmpty
        ? (product.emiPlans.firstWhere(
            (p) => p.isRecommended,
            orElse: () => product.emiPlans.first,
          ))
        : null;
    _isCheckoutSuccess = false;
    notifyListeners();
  }

  void selectVariant(ProductVariantModel variant) {
    _selectedVariant = variant;
    notifyListeners();
  }

  void selectEmiPlan(EmiPlanModel plan) {
    _selectedEmiPlan = plan;
    notifyListeners();
  }

  double get calculatedTotalPrice {
    if (_selectedProduct == null) return 0.0;
    final base = _selectedProduct!.basePrice;
    final offset = _selectedVariant?.priceOffset ?? 0.0;
    return base + offset;
  }

  double get calculatedMonthlyAmount {
    if (_selectedEmiPlan == null) return 0.0;
    final plan = _selectedEmiPlan!;
    if (plan.isNoCost) {
      return calculatedTotalPrice / plan.tenureMonths;
    }
    return plan.monthlyAmount;
  }

  void confirmCheckout() {
    _isCheckoutSuccess = true;
    notifyListeners();
  }

  void resetCheckoutState() {
    _isCheckoutSuccess = false;
    _selectedProduct = null;
    _selectedVariant = null;
    _selectedEmiPlan = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
