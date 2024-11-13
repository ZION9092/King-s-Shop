// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kings_shop/components/my_drawer.dart';
import 'package:kings_shop/components/my_product_tile.dart';
import 'package:kings_shop/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        actions: [
          //GO TO CART  BUTTON
          IconButton(onPressed: () => Navigator.pushNamed(context, '/cartPage'), icon: const Icon(Icons.shopping_cart_outlined))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Kings Shop",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          //shop title
          Center(child: Text("Choose from a handpicked list of premium laptops",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
          ),
          )),
          
          //product list
          SizedBox(
        height: 550,
        child: ListView.builder(
            itemCount: products.length,
            padding: const EdgeInsets.all(25),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              //get each indiviaul product from shop
              final product = products[index];
        
              //return as ProductTile ui
              return MyProductTile(product: product);
            }),
      ),
        ],
        
      )
    );
  }
}
