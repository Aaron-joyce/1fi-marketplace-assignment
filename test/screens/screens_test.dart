import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onefi_assignment_application/providers/marketplace_provider.dart';
import 'package:onefi_assignment_application/providers/navigation_provider.dart';
import 'package:onefi_assignment_application/screens/emi_dues_screen.dart';
import 'package:onefi_assignment_application/screens/home_screen.dart';
import 'package:onefi_assignment_application/screens/limit_screen.dart';
import 'package:onefi_assignment_application/screens/profile_screen.dart';
import 'package:onefi_assignment_application/screens/shop_screen.dart';
import 'package:provider/provider.dart';

void main() {
  group('Screen Rendering Widget Tests', () {
    testWidgets('HomeScreen renders hero banner and section headers', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomeScreen(),
        ),
      );

      expect(find.text('GET STARTED'), findsOneWidget);
      expect(find.text('OFFERS'), findsOneWidget);
      expect(find.text('SHOP USING 1FI AT TOP BRANDS'), findsOneWidget);
      expect(find.text('WHY PAY WITH 1FI'), findsOneWidget);
    });

    testWidgets('ShopScreen renders hero banner and segmented tabs', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => NavigationProvider()),
            ChangeNotifierProvider(create: (_) => MarketplaceProvider()),
          ],
          child: const MaterialApp(
            home: ShopScreen(),
          ),
        ),
      );

      expect(find.text('NO-COST EMIs'), findsOneWidget);
      expect(find.text('Top Brands'), findsWidgets);
      expect(find.text('Nearby Stores'), findsOneWidget);
      expect(find.text('1Fi Marketplace'), findsOneWidget);
    });

    testWidgets('EmiDuesScreen renders active loan details and next due amount', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: EmiDuesScreen(),
        ),
      );

      expect(find.text('EMI Dues'), findsOneWidget);
      expect(find.text('₹11,241.00'), findsOneWidget);
      expect(find.text('iPhone 15 Pro Max'), findsOneWidget);
    });

    testWidgets('LimitScreen renders credit limit and pledged portfolio', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LimitScreen(),
        ),
      );

      expect(find.text('Credit Limit'), findsOneWidget);
      expect(find.text('₹5,00,000.00'), findsOneWidget);
      expect(find.text('Pledged Mutual Funds'), findsOneWidget);
    });

    testWidgets('ProfileScreen renders user profile avatar and settings tiles', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ProfileScreen(),
        ),
      );

      expect(find.text('Rahul Sharma'), findsOneWidget);
      expect(find.text('Mutual Fund Portfolio'), findsOneWidget);
      expect(find.text('Bank Auto-Debit (NACH)'), findsOneWidget);
    });
  });
}
