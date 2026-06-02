import 'package:flutter/material.dart';

import 'models/shop.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(ShopScope(notifier: Shop(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nike Sneaker Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade900),
        scaffoldBackgroundColor: Colors.grey[300],
        useMaterial3: true,
      ),
      home: const IntroPage(),
    );
  }
}
