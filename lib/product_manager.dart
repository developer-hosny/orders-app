import 'package:flutter/material.dart';
import 'products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductManager(this.products);

  adsListView() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(width: 10.0),
        Container(
          width: 160.0,
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/food-2.jpg'),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 160.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/food.jpg'),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 160.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/food-2.jpg'),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 160.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/food.jpg'),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 160.0,
             decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/food-2.jpg'),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 160.0,
          color: Colors.red,
        ),
        SizedBox(width: 10.0),
        Container(
          width: 160.0,
          color: Colors.blue,
        ),
        SizedBox(width: 10.0),
        Container(
          width: 160.0,
          color: Colors.green,
        ),
        SizedBox(width: 10.0),
        Container(
          width: 160.0,
          color: Colors.yellow,
        ),
        SizedBox(width: 10.0),
        Container(
          width: 160.0,
          color: Colors.orange,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top:10.0),
        child: adsListView(),
        height: 100.0,
      ),
      Expanded(child: Products(products))
    ]);
  }
}
