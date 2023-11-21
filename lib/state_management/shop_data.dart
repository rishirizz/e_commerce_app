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
  addItemToCart(Product product, String productName, int quantity) {
    bool found = false;
    for (Product product in _cartItems) {
      if (product.name == productName) {
        product.quantity += quantity;
        found = true;
        break;
      }
    }
    if (!found) {
      _cartItems.add(
        product..quantity = 1, //first time, add quantity as 1.
      );
    }
    notifyListeners();
  }

  //remove items from the cart
  removeItemFromCart(String productName) {
    for (Product product in _cartItems) {
      if (product.name == productName) {
        if (product.quantity > 1) {
          product.quantity--;
        } else {
          _cartItems.remove(product..quantity = 0); //change qty back to 0
        }
        break;
      }
    }
    notifyListeners();
  }

//get the sum of total items present in the cart
  getTotalItemsAddedtoCart() {
    int total = 0;
    for (var i = 0; i < _cartItems.length; i++) {
      total += _cartItems[i].quantity;
    }
    return total.toString();
  }
  //No need to add notifyListeners here because the item has been already added to the cart and is being recorded.
}
