import 'package:flutter/material.dart';
import 'package:kings_shop/models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    Product(
      name: "Dell Latitude E7470",
      price: 99.99,
      description: "High fucntion laptop",
    ),
    Product(
      name: "HP Pavilion",
      price: 99.99,
      description: "Long Lasting Battery",
    ),
    Product(
      name: "Lenovo ThinkPad",
      price: 99.99,
      description: "Durable",
    ),
    Product(
      name: "Asus ZenBook",
      price: 99.99,
      description: "Fantastic gaming experiences...",
    ),
  ];

  //user cart
  final List<Product> _cart = [];
  //get product list
  List<Product> get shop => _shop;
  //get user cart
  List<Product> get cart => _cart;
  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
