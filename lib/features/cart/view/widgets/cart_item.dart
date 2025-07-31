import 'package:flutter/material.dart';
import 'package:reco_genie_task/core/model/menu_model.dart';

class CartItemTile extends StatelessWidget {
  final MenuModel item;
  final VoidCallback onRemove;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          item.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '${item.price.toStringAsFixed(2)} EGP',
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: onRemove,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
