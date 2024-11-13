// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kings_shop/components/my_buttons.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.shopping_cart_outlined,
            size: 75,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 15,),
            //shop name
            const Text("Kings Shop",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              ),
            ),
        
            const SizedBox(height: 10),
        
            //description
            Text("Latops for the Future",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: Theme.of(context).colorScheme.inversePrimary
            ),
            ),
            
            const SizedBox(height: 20),
            //button
            MyButtons(
              onTap: () => Navigator.pushNamed(context, '/shopPage'), 
              child: const Icon(Icons.arrow_forward, size: 30,)
              )
          ],
        ),
      ),
    );
  }
}