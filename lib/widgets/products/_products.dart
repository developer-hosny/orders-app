import 'package:flutter/material.dart';
import '../../models/product.dart';
// import 'package:orders_app/models/product.dart';

import 'package:scoped_model/scoped_model.dart';
import './product_card.dart';
import '../../scope-models/main.dart';

class Products extends StatelessWidget {

  Widget _buildProductList(List<Product> products) {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCard = Center(child: Text('There is no products'));
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model){
      return  _buildProductList(model.displayedProducts);
    }, );
    // 
  }
}
