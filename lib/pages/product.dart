import 'package:flutter/material.dart';
import 'package:orders_app/models/product.dart';
import 'dart:async';
import '../widgets/ui_elements/title_default.dart';
// import '../widgets/products/rate_tag.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scope-models/main.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;
  ProductPage(this.productIndex);

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

  Widget _buildAddressPriceRow(double price) {
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
      child: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        final Product product = model.allProducts[productIndex];

        return Scaffold(
          appBar: AppBar(
            title: Text(product.title,
                style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold)),
          ),
          body: ListView(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(product.image),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TitleDefault(product.title),
                ),
                _buildAddressPriceRow(product.price),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    product.description,
                    textAlign: TextAlign.justify,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            )
          ]),
        );
      }),
    );
  }
}
