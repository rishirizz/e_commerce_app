import 'package:e_commerce_app/components/navigation_drawer.dart';
import 'package:e_commerce_app/pages/cart_page.dart';
import 'package:e_commerce_app/state_management/shop_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});
  static const routeName = '/shop';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ShopDataProvider>(
        builder: (context, ShopDataProvider shopDataProvider, child) =>
            Scaffold(
          appBar: AppBar(
            title: const Text('SHOP PAGE'),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CartPage.routeName,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Badge(
                    label: (shopDataProvider.cartItems.isNotEmpty)
                        ? Text(
                            Provider.of<ShopDataProvider>(context,
                                    listen: false)
                                .getTotalItemsAddedtoCart(),
                          )
                        : null,
                    child: const Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                ),
              ),
            ],
          ),
          drawer: const AppDrawer(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: shopDataProvider.products.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Card(
                          elevation: 6,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    shopDataProvider.products[index].image,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    height: 300,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  shopDataProvider.products[index].name,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  shopDataProvider.products[index].description,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\u{20B9} ${shopDataProvider.products[index].price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        FloatingActionButton(
                                          heroTag: null,
                                          onPressed: () {
                                            Provider.of<ShopDataProvider>(
                                              context,
                                              listen: false,
                                            ).removeItemFromCart(
                                                shopDataProvider
                                                    .products[index].name);
                                          },
                                          child: const Icon(Icons.remove),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          shopDataProvider
                                              .products[index].quantity
                                              .toString(),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        FloatingActionButton(
                                          heroTag: null,
                                          onPressed: () {
                                            Provider.of<ShopDataProvider>(
                                              context,
                                              listen: false,
                                            ).addItemToCart(
                                              shopDataProvider.products[index],
                                              shopDataProvider
                                                  .products[index].name,
                                              // add a qty each time
                                            );
                                          },
                                          child: const Icon(Icons.add),
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
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CartPage.routeName,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          'GO TO CART',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
