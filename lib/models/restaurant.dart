import 'package:flutter/material.dart';

class Restaurant {
  final String title;
  final String type;
  final String description;
  final double per;
  final double min;
  final double rate;
  final String image;
  final String userEmail;
  final String userId;

  
  Restaurant(
      {@required this.title,
      @required this.type,
      @required this.description,
      @required this.per,
      @required this.min,
      @required this.rate,
      @required this.image,
      @required this.userEmail,
      @required this.userId});
}
