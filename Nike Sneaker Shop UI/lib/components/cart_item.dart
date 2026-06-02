import 'package:flutter/material.dart';

import '../models/shoe.dart';
import 'sneaker_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.shoe, required this.onRemove});

  final Shoe shoe;
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
        leading: SneakerImage(
          colors: shoe.colors,
          imagePath: shoe.imagePath,
          height: 58,
        ),
        title: Text(
          shoe.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('\$${shoe.price}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
