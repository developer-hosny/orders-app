import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;
  
  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          onPressed: () {
            addProduct({'title': 'Food Title', 'imageUrl' : 'assets/food.jpg'});
          },
          color: Theme.of(context).primaryColor,
          child: Text('Add Product'),
        ),
    );
  }
}