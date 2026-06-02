import 'package:flutter/material.dart';

import '../models/product.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.product, required this.onRemove});

  final Product product;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: product.color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Image.asset(product.imagePath, fit: BoxFit.contain),
          ),
        ),
        title: Text(product.name),
        subtitle: Text('\$${product.price}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
