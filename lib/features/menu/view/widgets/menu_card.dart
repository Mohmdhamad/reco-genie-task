import 'package:flutter/material.dart';
import 'package:reco_genie_task/core/model/menu_model.dart';
import 'package:reco_genie_task/core/data/cart_data.dart';

class MenuCard extends StatelessWidget {
  MenuCard({super.key, required this.model});
  final MenuModel model;

  void addToCart(BuildContext context) {
    if (!cartItems.value.contains(model)) {
      cartItems.value = [...cartItems.value, model];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${model.name} added to cart')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${model.name} is already in the cart')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(model.imageUrl, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    model.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Text(
                          '${model.price} egp',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.star, color: Colors.amber, size: 15),
                        Text(
                          '${model.rating} ',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () => addToCart(context),
                    label: const Text(
                      'Add to cart',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    icon: const Icon(
                      Icons.add_shopping_cart_outlined,
                      size: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

