import '../core/constants/app_colors.dart';
import '../models/brand_model.dart';

class BrandRepository {
  static List<BrandModel> getShopTopBrands() {
    return const [
      BrandModel(
        id: '1',
        name: 'Air India',
        subtitle: 'No-cost EMIs upto 18 months',
        backgroundColor: AppColors.brandAirIndia,
        wordmark: 'AIR INDIA',
      ),
      BrandModel(
        id: '2',
        name: 'Apple Premium Reseller',
        subtitle: 'No-cost EMIs upto 24 months',
        backgroundColor: AppColors.brandApple,
        wordmark: 'APPLE',
      ),
      BrandModel(
        id: '3',
        name: 'CaratLane',
        subtitle: 'No-cost EMIs upto 6 months',
        backgroundColor: AppColors.brandCaratLane,
        wordmark: 'CARAT LANE',
      ),
      BrandModel(
        id: '4',
        name: 'Reliance Digital',
        subtitle: 'No-cost EMIs upto 12 months',
        backgroundColor: AppColors.brandReliance,
        wordmark: 'RELIANCE\nDIGITAL',
      ),
      BrandModel(
        id: '5',
        name: 'Croma',
        subtitle: 'No-cost EMIs upto 18 months',
        backgroundColor: AppColors.brandCroma,
        wordmark: 'croma',
      ),
      BrandModel(
        id: '6',
        name: 'Vijay Sales',
        subtitle: 'No-cost EMIs upto 12 months',
        backgroundColor: AppColors.brandVijaySales,
        wordmark: 'VIJAY\nSALES',
      ),
    ];
  }

  static List<BrandModel> getHomeHorizontalBrands() {
    return const [
      BrandModel(
        id: '4',
        name: 'Reliance D...',
        subtitle: 'No-cost EMIs',
        backgroundColor: AppColors.brandReliance,
        wordmark: 'RELIANCE\nDIGITAL',
      ),
      BrandModel(
        id: '5',
        name: 'Croma',
        subtitle: 'No-cost EMIs',
        backgroundColor: AppColors.brandCroma,
        wordmark: 'croma',
      ),
      BrandModel(
        id: '6',
        name: 'Vijay Sales',
        subtitle: 'No-cost EMIs',
        backgroundColor: AppColors.brandVijaySales,
        wordmark: 'VIJAY\nSALES',
      ),
      BrandModel(
        id: '7',
        name: 'MakeMyTrip',
        subtitle: 'No-cost EMIs',
        backgroundColor: AppColors.brandMakeMyTrip,
        wordmark: 'make my trip',
      ),
      BrandModel(
        id: '1',
        name: 'Air India',
        subtitle: 'No-cost EMIs',
        backgroundColor: AppColors.brandAirIndia,
        wordmark: 'AIR INDIA',
      ),
    ];
  }
}
