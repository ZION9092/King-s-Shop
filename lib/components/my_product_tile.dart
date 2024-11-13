import 'package:flutter/material.dart';
import 'package:kings_shop/models/product.dart';
import 'package:kings_shop/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  //add to cart button pressed
  void addToCart(BuildContext context) {
  // dialog box to ensure if user wants to add to cart
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: const Text("Add this item to cart?"),
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
            context.read<Shop>().addToCart(product);
          },
          child: const Text("Yes"),
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //product image
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(25),
                      width: double.infinity,
                      child: const Icon(Icons.favorite)),
                ),

                const SizedBox(height: 25),

                //product name
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                //product description
                Text(
                  product.description,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //produc price
                Text('\$' + product.price.toStringAsFixed(2)),

                IconButton(
                  onPressed: () => addToCart(context),
                  icon: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).colorScheme.secondary),
                          padding: EdgeInsets.all(15),
                      child: const Icon(Icons.add)),
                )
              ],
            ),
          ]),
    );
  }
}
