import 'package:flutter/material.dart';

class Product {
  const Product({
    required this.name,
    required this.price,
    required this.description,
    required this.icon,
    required this.imagePath,
    required this.color,
  });

  final String name;
  final String price;
  final String description;
  final IconData icon;
  final String imagePath;
  final Color color;
}
