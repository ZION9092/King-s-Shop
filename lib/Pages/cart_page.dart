// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kings_shop/components/my_buttons.dart';
import 'package:kings_shop/models/product.dart';
import 'package:kings_shop/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    // dialog box to ensure if user wants to add to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          // cancel option
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),

          // yes button
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);

              // add to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  //user presses pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context, 
    builder: (context) => const AlertDialog(
      content: Text("User wants to pay, Connect to app's payment backend"),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Your Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
              child: cart.isEmpty ? 
              const Center(child: Text("Your Cart is empty...")) 
              : ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    //get indiviaul item in cart
                    final item = cart[index];

                    //return as cart tile ui
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                          onPressed: () => removeItemFromCart(context, item),
                          icon: const Icon(Icons.remove)),
                    );
                  })),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButtons(
                onTap: () => payButtonPressed(context), child: const Text("Pay")),
          )
        ],
      ),
    );
  }
}
