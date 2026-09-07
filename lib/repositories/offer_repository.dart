import '../models/offer_model.dart';

class OfferRepository {
  static List<OfferModel> getHomeOffers() {
    return const [
      OfferModel(
        id: '1',
        categoryTag: 'HOLIDAY VOUCHER DEAL',
        title: 'Book Your Euro-phoric\nEscape with 1Fi',
        priceTag: 'Starts at ₹2,481/mo',
        partnerLogoText: 'make my trip',
      ),
      OfferModel(
        id: '2',
        categoryTag: 'PREMIUM ELECTRONICS',
        title: 'Get Latest Tech with\nZero Down Payment',
        priceTag: 'Starts at ₹1,999/mo',
        partnerLogoText: 'croma',
      ),
    ];
  }
}
