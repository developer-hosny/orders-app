import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  final String address;
  AddressTag(this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 1.0),
      child: Text(
        address,
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }
}
