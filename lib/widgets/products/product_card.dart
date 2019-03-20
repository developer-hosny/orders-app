import 'package:flutter/material.dart';
import './price_tag.dart';
import './rate_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TitleDefault(product['title']),
        SizedBox(width: 8.0),
        RateTag(product['price'].toString()),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).primaryColor,
          onPressed: () => {
                Navigator.pushNamed<bool>(
                    context, '/product/' + productIndex.toString()),
              },
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          color: Theme.of(context).primaryColor,
          onPressed: () => {
                Navigator.pushNamed<bool>(
                    context, '/product/' + productIndex.toString()),
              },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed<bool>(
                  context, '/product/' + productIndex.toString());
            },
            child: Column(
              children: <Widget>[
                Image.asset(
                  product['imageUrl'],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: _buildTitlePriceRow(),
                ),
              ],
            ),
          ),
          AddressTag('Sharejah, UAE'),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
