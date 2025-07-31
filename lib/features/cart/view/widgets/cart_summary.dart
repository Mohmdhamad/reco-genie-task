import 'package:flutter/material.dart';
import 'package:reco_genie_task/core/data/cart_data.dart';
import 'package:reco_genie_task/features/cart/view/widgets/checkout_widget.dart';

class CartSummarySection extends StatelessWidget {
  const CartSummarySection({super.key});

  double getTotalPrice() {
    return cartItems.value.fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${getTotalPrice().toStringAsFixed(2)} EGP',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const CheckoutWidget(),
        ],
      ),
    );
  }
}
