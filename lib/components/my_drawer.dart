// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kings_shop/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 75,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),

            const SizedBox(height: 25),

            //home tile
            MyListTile(
              text: "Home",
              icon: Icons.home_filled,
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(
              height: 10,
            ),
            //cart tile
            MyListTile(
              text: "Cart",
              icon: Icons.shopping_cart_checkout_outlined,
              onTap: () {
                //pop drawer first
                Navigator.pop(context);
                //push to cartPage
                Navigator.pushNamed(context, '/cartPage');
              },
            ),
          ],
        ),
        //exit tile
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: MyListTile(
            text: "Exit",
            icon: Icons.logout,
            onTap: ()=> Navigator.pushNamedAndRemoveUntil(
              context, '/introPage', (route) => false
            )
          ),
        )
      ]),
    );
  }
}
