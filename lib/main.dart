import 'package:e_commerce_app/pages/cart_page.dart';
import 'package:e_commerce_app/pages/shop_page.dart';
import 'package:e_commerce_app/pages/splash_page.dart';
import 'package:e_commerce_app/state_management/shop_data.dart';
import 'package:e_commerce_app/state_management/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ShopDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeDataProvider(),
        ),
      ],
      builder: (BuildContext context, Widget? child) =>
          Consumer<ThemeDataProvider>(
        builder: (context, ThemeDataProvider themeDataProvider, child) =>
            MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
            useMaterial3: true,
          ),
          home: const SplashPage(),
          onGenerateRoute: (RouteSettings settings) {
            debugPrint('build route for ${settings.name}');
            var routes = <String, WidgetBuilder>{
              SplashPage.routeName: (BuildContext context) =>
                  const SplashPage(),
              ShopPage.routeName: (BuildContext context) => const ShopPage(),
              CartPage.routeName: (BuildContext context) => const CartPage(),
            };
            WidgetBuilder builder = routes[settings.name]!;
            return MaterialPageRoute(
              builder: (ctx) => builder(ctx),
            );
          },
        ),
      ),
    );
  }
}
