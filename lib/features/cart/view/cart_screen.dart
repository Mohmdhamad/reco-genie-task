import 'package:flutter/material.dart';
import 'package:reco_genie_task/core/data/cart_data.dart';
import 'package:reco_genie_task/core/model/menu_model.dart';
import 'package:reco_genie_task/features/cart/view/widgets/cart_item.dart';
import 'package:reco_genie_task/features/cart/view/widgets/cart_summary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  void onRemove(MenuModel item) {
    cartItems.value = List.from(cartItems.value)..remove(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: ValueListenableBuilder<List<MenuModel>>(
        valueListenable: cartItems,
        builder: (context, items, _) {
          if (items.isEmpty) {
            return const Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CartItemTile(
                      item: item,
                      onRemove: () => onRemove(item),
                    );
                  },
                ),
              ),
               const CartSummarySection(),
            ],
          );
        },
      ),
    );
  }
}
