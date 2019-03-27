import 'package:flutter/material.dart';
import '../widgets/products/products.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scope-models/main.dart';

class ProductsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () => {
                  Navigator.pushReplacementNamed(context, '/admin'),
                },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          actions: <Widget>[
            ScopedModelDescendant(builder:
                (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon: Icon(model.displayFavoritesOnly
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  model.toggleDisplayMode();
                },
              );
            })
          ],
          // TextField(
          //     style: TextStyle(color: Colors.white),
          //     decoration: InputDecoration(
          //       labelText: 'Search',
          //       // fillColor: Colors.white,
          //       labelStyle: TextStyle(color: Colors.white),
          //       prefixIcon: Icon(
          //         Icons.search,
          //         color: Colors.white,
          //       ),
          //     ),
          //     onChanged: (value) {})
        ),
        body: Column(children: [
          Expanded(
            child: Products(),
          ),
          // TextField(focusNode: myFocusNode),
        ]),
      ),
    );
  }
}
