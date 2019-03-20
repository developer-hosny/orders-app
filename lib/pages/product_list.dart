import 'package:flutter/material.dart';
import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);
  Widget _buildEditIcon(BuildContext context, index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ProductEditPage(
                  product: products[index],
                  updateProduct: updateProduct,
                  productIndex: index,
                )));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            key: Key(products[index]['title']),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                deleteProduct(index);
              }
            },
            background: Container(
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  dense: true,
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(products[index]['imageUrl']),
                  ),
                  // leading: Image.asset(products[index]['imageUrl']),
                  title: Text(products[index]['title']),
                  subtitle: Text('AED' + products[index]['price'].toString()),
                  trailing: _buildEditIcon(context, index),
                ),
                Divider()
              ],
            ));
      },
      itemCount: products.length,
    );
  }
}
