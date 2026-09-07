import 'package:flutter/material.dart';

class BrandModel {
  final String id;
  final String name;
  final String subtitle;
  final Color backgroundColor;
  final String wordmark;

  const BrandModel({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.backgroundColor,
    required this.wordmark,
  });
}
