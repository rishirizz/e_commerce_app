import 'package:e_commerce_app/components/navigation_drawer.dart';
import 'package:e_commerce_app/state_management/shop_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  static const routeName = '/cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ShopDataProvider>(
        builder: (context, ShopDataProvider shopDataProvider, child) =>
            Scaffold(
          appBar: AppBar(
            title: const Text('CART PAGE'),
          ),
          drawer: const AppDrawer(),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: shopDataProvider.cartItems.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Card(
                      elevation: 3,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  shopDataProvider.cartItems[index].name,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '\u{20B9} ${shopDataProvider.cartItems[index].price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Qty',
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        Icons.remove_circle,
                                      ),
                                      onPressed: () {
                                        Provider.of<ShopDataProvider>(
                                          context,
                                          listen: false,
                                        ).removeItemFromCart(shopDataProvider
                                            .products[index].name);
                                      },
                                    ),
                                    Text(
                                      shopDataProvider.cartItems[index].quantity
                                          .toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        Icons.add_circle,
                                      ),
                                      onPressed: () {
                                        Provider.of<ShopDataProvider>(
                                          context,
                                          listen: false,
                                        ).addItemToCart(
                                          shopDataProvider.products[index],
                                          shopDataProvider.products[index].name,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
