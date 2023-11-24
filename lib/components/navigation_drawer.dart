import 'package:e_commerce_app/components/shopping_list_tile.dart';
import 'package:e_commerce_app/pages/cart_page.dart';
import 'package:e_commerce_app/pages/shop_page.dart';
import 'package:e_commerce_app/state_management/shop_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset(
                    'assets/seller.png',
                    height: 10,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              ShoppingListTile(
                title: 'SHOP',
                iconData: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    ShopPage.routeName,
                  );
                },
                trailingWidget: null,
              ),
              ShoppingListTile(
                title: 'CART',
                iconData: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    CartPage.routeName,
                  );
                },
                trailingWidget: CircleAvatar(
                  child: Consumer<ShopDataProvider>(
                    builder:
                        (context, ShopDataProvider shopDataProvider, child) =>
                            Text(
                      Provider.of<ShopDataProvider>(context, listen: false)
                          .getTotalItemsAddedtoCart(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // const Spacer(),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 10.0),
          //   child: Consumer<ThemeDataProvider>(
          //     builder: (context, ThemeDataProvider themeDataProvider, child) =>
          //         SwitchListTile(
          //       title: Text(
          //         (themeDataProvider.isDark == false)
          //             ? 'Light theme'
          //             : 'Dark Theme',
          //       ),
          //       value: themeDataProvider.isDark,
          //       onChanged: (value) {
          //         Provider.of<ThemeDataProvider>(context, listen: false)
          //             .toggleTheme();
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
