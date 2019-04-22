import 'package:flutter/material.dart';
import 'package:orders_app/scope-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class SideDrawer extends StatefulWidget {
  BuildContext _context;

  SideDrawer(this._context);
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {

    Widget _buildSideDrawer(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text(model.authenticatedUser == null
                  ? 'Gust'
                  : model.authenticatedUser.email),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Login'),
              onTap: () => {
                    Navigator.pushReplacementNamed(context, '/login'),
                  },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Products'),
              onTap: () => {
                    Navigator.pushReplacementNamed(context, '/admin'),
                  },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Restaurant Profile'),
              onTap: () => {
                    Navigator.pushNamed(context, '/restaurant_edit'),
                  },
            ),
          ],
        ),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return _buildSideDrawer(widget._context);
  }
}