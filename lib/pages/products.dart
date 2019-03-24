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
  @override
  void initState() {
    super.initState();
  }

  adsListView() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(width: 5.0),
        Container(
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(color: Colors.lime),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/subway.jpg'),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(color: Colors.lime),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/kfc.gif'),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(color: Colors.lime),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/Pizza_Hut_logo.png'),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(color: Colors.lime),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/burgerking.png'),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(color: Colors.lime),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/churchs.png'),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(color: Colors.lime),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/food-6.jpg'),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(color: Colors.lime),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/food-7.jpg'),
            ),
          ),
        ),
        SizedBox(width: 10.0),
      ],
    );
  }

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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
            child: adsListView(),
            height: 100.0,
          ),
          Expanded(
            child: Products(),
          ),
          // TextField(focusNode: myFocusNode),
        ]),
      ),
    );
  }
}
