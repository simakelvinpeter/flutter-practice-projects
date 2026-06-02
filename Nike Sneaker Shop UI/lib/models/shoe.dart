import 'package:flutter/material.dart';

class Shoe {
  const Shoe({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.colors,
  });

  final String name;
  final String price;
  final String description;
  final String imagePath;
  final List<Color> colors;
}
