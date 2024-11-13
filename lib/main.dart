import 'package:flutter/material.dart';
import 'package:kings_shop/Pages/cart_page.dart';
import 'package:kings_shop/Pages/intro_page.dart';
import 'package:kings_shop/Pages/shop_page.dart';
import 'package:kings_shop/models/shop.dart';
import 'package:kings_shop/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
      )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "King's Shop",
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/introPage': (context) => const IntroPage(),
        '/shopPage': (context) => const ShopPage(),
        '/cartPage': (context) => const CartPage(),
      },
    );
  }
}
