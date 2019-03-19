import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/ui_elements/title_default.dart';
import '../widgets/products/rate_tag.dart';
class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductPage(this.title, this.imageUrl, this.price, this.description);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannot be undone!'),
            actions: <Widget>[
              FlatButton(
                child: Text('DISCORD'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('CONTINUE'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

  Widget _buildAddressPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              'Sharjah, UAE',
              style: TextStyle(fontFamily: 'Cairo', color: Colors.grey),
            )),
          // RateTag(),
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Text(
             price.toString(),
            style: TextStyle(fontFamily: 'Cairo', color: Colors.grey),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(title,
                style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold)),
          ),
          body: ListView(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(imageUrl),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TitleDefault(title),
                ),
                _buildAddressPriceRow(),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            )
          ])),
    );
  }
}
