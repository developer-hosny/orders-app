import 'package:flutter/material.dart';
import 'package:orders_app/pages/restaurants.dart';
import 'package:orders_app/pages/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          // appBar: AppBar(backgroundColor: Colors.transparent,title: _buildSearch(context),),
          // drawer: _buildSideDrawer(context),
          bottomNavigationBar: Container(
            height: 60.0,
            color: Colors.white,
            child: TabBar(
              onTap: (selectedTabIndex) {
                setState(() {
                  _selectedTabIndex = selectedTabIndex;
                });
              },
              tabs: [
                Tab(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/scooter.png',
                        scale: 4,
                        fit: BoxFit.cover,
                        color: _selectedTabIndex == 0 ? null : Colors.grey.shade400,
                      ),
                      Container(
                        height: 10.0,
                        child: Text(
                          'Orders',
                          style: TextStyle(color: Colors.grey, fontSize: 10.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/search.png',
                        scale: 4,
                        fit: BoxFit.cover,
                        color: _selectedTabIndex == 1 ? null : Colors.grey.shade400,
                      ),
                      Container(
                        height: 10.0,
                        child: Text(
                          'Search',
                          style: TextStyle(color: Colors.grey, fontSize: 10.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/profile.png',
                        scale: 4,
                        fit: BoxFit.cover,
                        color: _selectedTabIndex == 2 ? null : Colors.grey.shade400,
                      ),
                      Container(
                        height: 10.0,
                        child: Text(
                          'Profile',
                          style: TextStyle(color: Colors.grey, fontSize: 10.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              RestaurantsPage(),
              Container(),
              AuthPage(),
            ],
          )),
    );
  }
}
