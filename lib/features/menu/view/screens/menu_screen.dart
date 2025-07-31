import 'package:flutter/material.dart';
import 'package:reco_genie_task/features/menu/view/widgets/menu_appbar.dart';
import 'package:reco_genie_task/features/menu/view/widgets/menu_list.dart';
import 'package:reco_genie_task/features/cart/view/cart_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: menuAppbar(),
      body: const Column(
        children: [
          Expanded(child: MenuList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  CartScreen()),
          );
        },
        child: const Icon(Icons.shopping_cart,color: Colors.black,),
      ),
    );
  }
}
