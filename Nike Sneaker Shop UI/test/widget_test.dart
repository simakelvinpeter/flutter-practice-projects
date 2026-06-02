import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nike_sneaker_shop/main.dart';
import 'package:nike_sneaker_shop/models/shop.dart';

void main() {
  testWidgets('opens sneaker shop from intro page', (tester) async {
    await tester.pumpWidget(ShopScope(notifier: Shop(), child: const MyApp()));

    expect(find.text('Just Do It'), findsOneWidget);

    await tester.tap(find.text('Shop Now'));
    await tester.pumpAndSettle();

    expect(find.text('Hot Picks'), findsOneWidget);
    expect(find.text('Nike Zoom FREAK'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag), findsOneWidget);
  });
}
