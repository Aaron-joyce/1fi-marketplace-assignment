import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_provider.dart';
import '../widgets/common/floating_bottom_nav_bar.dart';
import 'emi_dues_screen.dart';
import 'home_screen.dart';
import 'limit_screen.dart';
import 'profile_screen.dart';
import 'shop_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const List<Widget> _screens = [
    HomeScreen(),
    ShopScreen(),
    EmiDuesScreen(),
    LimitScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: navProvider.currentBottomNavIndex,
        children: _screens,
      ),
      bottomNavigationBar: FloatingBottomNavBar(
        currentIndex: navProvider.currentBottomNavIndex,
        onTap: (index) {
          navProvider.setBottomNavIndex(index);
        },
      ),
    );
  }
}
