import 'package:flutter/material.dart';

import 'shoe.dart';

class Shop extends ChangeNotifier {
  final List<Shoe> _shoeShop = const [
    Shoe(
      name: 'Nike Zoom FREAK',
      price: '236',
      description: 'The forward-thinking design of his latest signature shoe.',
      imagePath: 'assets/images/zoom_freak.png',
      colors: [Color(0xFFEDEDED), Color(0xFF111111), Color(0xFFEF4444)],
    ),
    Shoe(
      name: 'Nike Air Max',
      price: '220',
      description: 'A classic look with soft cushioning for everyday comfort.',
      imagePath: 'assets/images/air_max.png',
      colors: [Color(0xFFF7F7F7), Color(0xFF1F2937), Color(0xFF3B82F6)],
    ),
    Shoe(
      name: 'Nike Air Jordan',
      price: '240',
      description: 'Court-inspired style made to stand out anywhere.',
      imagePath: 'assets/images/air_jordan.png',
      colors: [Color(0xFFF8FAFC), Color(0xFFB91C1C), Color(0xFF111827)],
    ),
    Shoe(
      name: 'Nike Pegasus',
      price: '190',
      description: 'Responsive foam and a lightweight feel for daily miles.',
      imagePath: 'assets/images/pegasus.png',
      colors: [Color(0xFFF1F5F9), Color(0xFF334155), Color(0xFFF97316)],
    ),
  ];

  final List<Shoe> _userCart = [];

  List<Shoe> get shoeShop => _shoeShop;

  List<Shoe> get userCart => _userCart;

  void addItemToCart(Shoe shoe) {
    _userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    _userCart.remove(shoe);
    notifyListeners();
  }
}

class ShopScope extends InheritedNotifier<Shop> {
  const ShopScope({
    super.key,
    required Shop super.notifier,
    required super.child,
  });

  static Shop of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ShopScope>();
    assert(scope != null, 'No ShopScope found in context');
    return scope!.notifier!;
  }
}
