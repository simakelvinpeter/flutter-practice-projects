import 'package:flutter/material.dart';

import '../components/shoe_tile.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = ShopScope.of(context);
    final shoes = shop.shoeShop;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search', style: TextStyle(color: Colors.grey[600])),
              Icon(Icons.search, color: Colors.grey[600]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            'Everyone flies.. some fly longer than others',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Hot Picks',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                'See all',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: shoes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ShoeTile(shoe: shoes[index]);
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Divider(color: Colors.white),
        ),
      ],
    );
  }
}
