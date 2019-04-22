import 'package:flutter/material.dart';

class Restaurant {
  final String id;
  final String title;
  final String type;
  final String description;
  final double min;
  final double max;
  final String phone;
  final String address;
  final double rate;
  final String image;
  final String userEmail;
  final String userId;

  Restaurant(
      {@required this.id,
      @required this.title,
      @required this.type,
      @required this.description,
      @required this.min,
      @required this.max,
      @required this.phone,
      @required this.address,
      this.rate,
      @required this.image,
      @required this.userEmail,
      @required this.userId});
}
