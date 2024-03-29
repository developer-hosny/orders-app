import 'package:flutter/material.dart';

class Product {
  final String id;
  final String restaurantId;
  final String title;
  final String description;
  final double price;
  final String image;
  final bool isFavorite;
  final String userEmail;
  final String userId;

  Product(
      {@required this.id,
      @required this.restaurantId,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.image,
      this.isFavorite = false,
      @required this.userEmail,
      @required this.userId});
}
