import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'providers/marketplace_provider.dart';
import 'providers/navigation_provider.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const OneFiApp());
}

class OneFiApp extends StatelessWidget {
  const OneFiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => MarketplaceProvider()),
      ],
      child: MaterialApp(
        title: '1Fi App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const MainScreen(),
      ),
    );
  }
}
