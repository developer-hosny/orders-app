import 'package:flutter/material.dart';

class RateTag extends StatelessWidget {
  final String rate;
  RateTag(this.rate);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        rate,
        style: TextStyle(fontFamily: 'Cairo', color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
