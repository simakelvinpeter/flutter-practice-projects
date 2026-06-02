import 'package:flutter/material.dart';

import 'product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = const [
    Product(
      name: 'Premium Hoodie',
      price: '65.99',
      description: 'Soft cotton fleece hoodie for everyday comfort.',
      icon: Icons.checkroom,
      imagePath: 'assets/images/hoodie.png',
      color: Color(0xFF111827),
    ),
    Product(
      name: 'Smart Watch',
      price: '149.99',
      description: 'Minimal digital watch with a clean matte strap.',
      icon: Icons.watch,
      imagePath: 'assets/images/smart_watch.png',
      color: Color(0xFF57534E),
    ),
    Product(
      name: 'Sunglasses',
      price: '45.99',
      description: 'Classic tinted lenses with a lightweight frame.',
      icon: Icons.wb_sunny_outlined,
      imagePath: 'assets/images/sunglasses.png',
      color: Color(0xFFCA8A04),
    ),
    Product(
      name: 'Travel Backpack',
      price: '89.99',
      description: 'Durable everyday bag with roomy storage pockets.',
      icon: Icons.backpack,
      imagePath: 'assets/images/backpack.png',
      color: Color(0xFF0F766E),
    ),
  ];

  final List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}

class ShopScope extends InheritedNotifier<Shop> {
  const ShopScope({super.key, required Shop shop, required super.child})
    : super(notifier: shop);

  static Shop of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ShopScope>();
    assert(scope != null, 'No ShopScope found in context');
    return scope!.notifier!;
  }
}
