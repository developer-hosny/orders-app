import 'package:flutter/material.dart';
// import 'package:orders_app/models/product.dart';
import '../scope-models/main.dart';
import './product_edit.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductListPage extends StatelessWidget {
  Widget _buildEditIcon(BuildContext context, index, MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(index);
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (BuildContext context) => ProductEditPage()),
        ).then((_) {
          model.selectProduct(null);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(model.allProducts[index].title),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  model.selectProduct(index);
                  model.deleteProduct();
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
                      backgroundImage: AssetImage(model.allProducts[index].image),
                    ),
                    // leading: Image.asset(products[index]['imageUrl']),
                    title: Text(model.allProducts[index].title),
                    subtitle:
                        Text('AED' + model.allProducts[index].price.toString()),
                    trailing: _buildEditIcon(context, index, model),
                  ),
                  Divider()
                ],
              ));
        },
        itemCount: model.allProducts.length,
      );
    });
  }
}
