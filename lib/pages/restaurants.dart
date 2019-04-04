import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
// import '../models/restaurant.dart';
import '../models/user.dart';
import '../scope-models/main.dart';

class RestaurantsPage extends StatefulWidget {
  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  User _authenticatedUser;

  Widget _buildAdsListView() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 100.0, left: 10.0),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage('assets/icons/passion.png'),
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                width: 18.0,
                height: 18.0,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Trending Brands',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              )
            ],
          ),
        ),
        Container(
          // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
          height: 100.0,
          child: ListView(
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
          ),
        )
      ],
    );
  }

  Widget _buildRestaurantCard(
      BuildContext context, int index, MainModel model) {
    return GestureDetector(
      onTap: () {
        print(model.allRestaurants[index].title);
        Navigator.pushNamed(context, '/products');
      },
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          height: 130.0,
          // decoration: BoxDecoration(color: Color.fromRGBO(100, 100, 255, .9)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(8.0),
                      child: Image.asset(
                        model.allRestaurants[index].image,
                        height: 92.0,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          model.allRestaurants[index].title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          model.allRestaurants[index].type,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 11.0,
                              color: Colors.black54),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 2.0),
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade200,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '\$',
                                style: TextStyle(
                                    fontSize: 8.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'AED' +
                                  model.allRestaurants[index].per.toString() +
                                  ' per person',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 10.0,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 2.0),
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: Colors.red.shade200,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '\$',
                                style: TextStyle(
                                    fontSize: 8.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'AED' +
                                  model.allRestaurants[index].min.toString() +
                                  ' min order',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 10.0,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.lime,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      model.allRestaurants[index].rate.toString(),
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Orders App'),
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
        ],
      ),
    );
  }

  void _toggleDrawerMenu(BuildContext context) {
    Scaffold.of(context).openDrawer();
    // _toggleDrawer == false
    //     ? Scaffold.of(context).openDrawer()
    //     :(_);
    // _toggleDrawer = !_toggleDrawer;
  }

  Widget _buildSearch(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWith = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.80;

    return Positioned(
      top: 0.0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.white,
        // width: targetWith,
        // height: 100.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _toggleDrawerMenu(context);
              },
            ),
            Container(
              width: targetWith,
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.lime,
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).viewInsets.top + 30, right: 10.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15.0, color: Colors.black87),
                      decoration: InputDecoration(
                          contentPadding:
                              new EdgeInsets.symmetric(vertical: 0.0),
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ), // icon is 48px widget.
                          ),
                          hintText: 'Search for restaurants, dishes...',
                          hintStyle: TextStyle(
                            fontSize: 11.0,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // Center(child: Container(
    //   // color: Colors.green,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: <Widget>[
    //       Container(
    //         decoration: BoxDecoration(
    //             color: Colors.white,
    //             border: Border.all(
    //               color: Colors.lime,
    //             ),
    //             borderRadius: BorderRadius.circular(5.0)),
    //         padding: EdgeInsets.all(8.0),
    //         margin: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top + 30),
    //         width: targetWith,
    //         height: 50.0,
    //         child: Row(
    //           children: <Widget>[
    //             Flexible(
    //               flex: 2,
    //               child: TextFormField(
    //                 textAlign: TextAlign.left,
    //                 style: TextStyle(fontSize: 15.0, color: Colors.black87),
    //                 decoration: InputDecoration(
    //                     contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
    //                     border: InputBorder.none,
    //                     prefixIcon: Padding(
    //                       padding: EdgeInsets.all(0.0),
    //                       child: Icon(
    //                         Icons.search,
    //                         color: Colors.grey,
    //                       ), // icon is 48px widget.
    //                     ),
    //                     hintText: 'Search for restaurants, dishes...',
    //                     hintStyle: TextStyle(fontSize: 11.0)),
    //               ),
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // ));
  }

  Widget _buildOffersArea() {
    return Container(
        margin: EdgeInsets.only(top: 0.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              elevation: 0.3,
              child: Container(
                height: 60.0,
                width: 90.0,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/icons/discount.png'),
                      height: 19.0,
                      width: 19.0,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                    ),
                    Text(
                      'Great Offers',
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0.3,
              child: Container(
                height: 60.0,
                width: 90.0,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/icons/serve.png'),
                      height: 19.0,
                      width: 19.0,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                    ),
                    Text(
                      'New Arrivals',
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0.3,
              child: Container(
                height: 60.0,
                width: 90.0,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/icons/medal.png'),
                      height: 19.0,
                      width: 19.0,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                    ),
                    Text(
                      'Recommended',
                      softWrap: true,
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildRestaurantsListView(BuildContext context, MainModel model) {
    return Expanded(
      flex: 1,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 0.0, bottom: 100.0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: model.allRestaurants.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRestaurantCard(context, index, model);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if(_restaurants == null)
    // final double deviceWidth = MediaQuery.of(context).size.width;
    // final double targetWith = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent,title: _buildSearch(context),),
      drawer: _buildSideDrawer(context),
      body: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        final double deviceHeight = MediaQuery.of(context).size.height;
        final double restaurantCardHeight = 130;

        final countOfRestaurants =
            model.allRestaurants != null ? model.allRestaurants.length : 0;

        final double targetHeight = (deviceHeight / 2) +
            (restaurantCardHeight * countOfRestaurants) +
            restaurantCardHeight;

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  height: targetHeight,
                  child: Column(
                    children: <Widget>[
                      _buildAdsListView(),
                      _buildOffersArea(),
                      _buildRestaurantsListView(context, model),
                    ],
                  ),
                ),
              ),
              _buildSearch(context),
            ],
          ),
        );
      }),
    );
  }
}
