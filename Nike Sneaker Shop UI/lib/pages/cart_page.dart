import 'package:flutter/material.dart';

import '../components/cart_item.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = ShopScope.of(context);
    final cart = shop.userCart;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Cart',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text(
                      'Your cart is empty',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final shoe = cart[index];
                      return CartItem(
                        shoe: shoe,
                        onRemove: () => shop.removeItemFromCart(shoe),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
