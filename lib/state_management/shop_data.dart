import 'package:e_commerce_app/models/products.dart';
import 'package:flutter/material.dart';

class ShopDataProvider extends ChangeNotifier {
  //list of the products
  final List<Product> _products = [
    Product(
      name: 'Maggi',
      price: 12.0,
      description: 'Noodles',
      // image: '',
    ),
    Product(
      name: 'Top Ramen',
      price: 12.0,
      description: 'Noodles',
      // image: '',
    ),
  ];

//get all the products
  List<Product> get products => _products;

//Product cartItems
  final List<Product> _cartItems = [];

//get the cart Items
  List<Product> get cartItems => _cartItems;

  //add items to the cart
  addItemToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  //remove items from the cart
  removeItemFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
