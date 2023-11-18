import 'package:e_commerce_app/components/navigation_drawer.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});
  static const routeName = '/shop';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SHOP PAGE'),
        ),
        drawer: const AppDrawer(),
      ),
    );
  }
}
