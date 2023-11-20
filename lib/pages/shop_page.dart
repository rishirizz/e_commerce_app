import 'package:e_commerce_app/components/navigation_drawer.dart';
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
          ),
          drawer: const AppDrawer(),
          body: Padding(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\u{20B9} ${shopDataProvider.products[index].price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Add to Cart'),
                                          content: const Text(
                                            'Are you sure to add the items to the cart?',
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('NO'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Provider.of<ShopDataProvider>(
                                                        context)
                                                    .addItemToCart(
                                                        shopDataProvider
                                                            .products[index]);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('YES'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Icon(Icons.add),
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
