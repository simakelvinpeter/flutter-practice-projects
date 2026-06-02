import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_ecommerce_app/main.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';

void main() {
  testWidgets('opens minimal ecommerce shop from intro page', (tester) async {
    await tester.pumpWidget(ShopScope(shop: Shop(), child: const MyApp()));

    expect(find.text('Minimal Shop'), findsOneWidget);

    await tester.tap(find.text('Shop Now'));
    await tester.pumpAndSettle();

    expect(find.text('Shop Page'), findsOneWidget);
    expect(find.text('Hot Picks'), findsOneWidget);
    expect(find.text('Premium Hoodie'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
  });
}
