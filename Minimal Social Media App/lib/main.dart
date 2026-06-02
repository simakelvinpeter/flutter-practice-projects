import 'package:flutter/material.dart';

import 'models/social_database.dart';
import 'pages/home_page.dart';

void main() {
  runApp(SocialScope(database: SocialDatabase(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minimal Social',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade900),
        scaffoldBackgroundColor: Colors.grey[300],
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
