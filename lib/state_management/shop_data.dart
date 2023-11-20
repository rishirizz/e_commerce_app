import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:flutter/material.dart';

class ShopDataProvider extends ChangeNotifier {
  //list of the products
  final List<Product> _products = [
    Product(
      name: 'Boiled Egg',
      price: 60.0,
      description: kAboutBoiledEgg,
      image: kBoiledEggImage,
    ),
    Product(
      name: 'Chinese',
      price: 220.0,
      description: kAboutChinese,
      image: kChineseImage,
    ),
    Product(
      name: 'Momos',
      price: 120.0,
      description: kAboutMomo,
      image: kMomoImage,
    ),
    Product(
      name: 'Pastry',
      price: 85.0,
      description: kAboutPastry,
      image: kPastryImage,
    ),
    Product(
      name: 'Pizza',
      price: 499.0,
      description: kAboutSandwich,
      image: kPizzaImage,
    ),
    Product(
      name: 'Pudding',
      price: 145.0,
      description: kAboutPudding,
      image: kPuddingImage,
    ),
    Product(
      name: 'Salad',
      price: 92.0,
      description: kAboutSalad,
      image: kSaladImage,
    ),
    Product(
      name: 'Sandwich',
      price: 220.0,
      description: kAboutSandwich,
      image: kSandwichImage,
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
