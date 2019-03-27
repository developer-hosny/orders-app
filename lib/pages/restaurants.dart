import 'package:flutter/material.dart';

class RestaurantsPage extends StatelessWidget {
  final List<Map<String, dynamic>> _restaurants = [
    {
      'title': 'Al Bait Al Malaki Mandi',
      'type': 'mandy, mazbi, madfon',
      'per': 20.0,
      'min': 100.0,
      'image': 'assets/food-1.jpg',
      'rate': 4.2
    },
    {
      'title': 'Falafil Faryha Cfetria',
      'per': 20.0,
      'min': 100.0,
      'type': 'Lebnanese, Arabian, Pizza, Grill',
      'image': 'assets/food-2.jpg',
      'rate': 3.2
    },
    {
      'title': 'Al Bait Al Malaki Mandi',
      'type': 'mandy, mazbi, madfon',
      'per': 20.0,
      'min': 100.0,
      'image': 'assets/food-1.jpg',
      'rate': 5.0
    },
    {
      'title': 'Falafil Faryha Cfetria',
      'per': 20.0,
      'min': 100.0,
      'type': 'Lebnanese, Arabian, Pizza, Grill',
      'image': 'assets/food-2.jpg',
      'rate': 3.2
    },
    {
      'title': 'Al Bait Al Malaki Mandi',
      'type': 'mandy, mazbi, madfon',
      'per': 20.0,
      'min': 100.0,
      'image': 'assets/food-1.jpg',
      'rate': 4.2
    },
    {
      'title': 'Falafil Faryha Cfetria',
      'per': 20.0,
      'min': 100.0,
      'type': 'Lebnanese, Arabian, Pizza, Grill',
      'image': 'assets/food-2.jpg',
      'rate': 4.2
    },
    {
      'title': 'Al Bait Al Malaki Mandi',
      'type': 'mandy, mazbi, madfon',
      'per': 20.0,
      'min': 100.0,
      'image': 'assets/food-1.jpg',
      'rate': 4.2
    },
    {
      'title': 'Falafil Faryha Cfetria',
      'per': 20.0,
      'min': 100.0,
      'type': 'Lebnanese, Arabian, Pizza, Grill',
      'image': 'assets/food-2.jpg',
      'rate': 4.2
    }
  ];

  Widget _buildAdsListView() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 90.0, left: 10.0),
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

  Widget _buildRestaurantCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print(_restaurants[index]['title']);
        // Navigator.pushReplacementNamed(context, '/products');
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
                        _restaurants[index]['image'],
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
                          _restaurants[index]['title'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          _restaurants[index]['type'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 11.0,
                              color: Colors.black54),
                        ),
                        Text(
                          'AED' +
                              _restaurants[index]['per'].toString() +
                              ' per person',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 10.0,
                              color: Colors.grey),
                        ),
                        Text(
                          'AED' +
                              _restaurants[index]['min'].toString() +
                              ' min order',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 10.0,
                              color: Colors.grey),
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
                      _restaurants[index]['rate'].toString(),
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

  Widget _buildSearch(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWith = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    return Positioned(
      top: 0.0,
      width: MediaQuery.of(context).size.width,
      
      child: Center(child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.lime,
            ),
            borderRadius: BorderRadius.circular(5.0)),
        padding: EdgeInsets.all(8.0),
        margin:
            EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top + 30),
        width: targetWith,
        height: 50.0,
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: TextFormField(
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.0, color: Colors.black87),
                decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ), // icon is 48px widget.
                    ),
                    hintText: 'Search for restaurants, dishes...',
                    hintStyle: TextStyle(fontSize: 11.0)),
              ),
            ),
          ],
        ),
      )),
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

  Widget _buildRestaurantsListView(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 0.0, bottom: 100.0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRestaurantCard(context, index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final double deviceWidth = MediaQuery.of(context).size.width;
    // final double targetWith = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double restaurantCardHeight = 130;
    final double targetHeight = (deviceHeight / 2) +
        (restaurantCardHeight * _restaurants.length) +
        restaurantCardHeight;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            height: targetHeight,
            child: Column(
              children: <Widget>[
                _buildAdsListView(),
                _buildOffersArea(),
                _buildRestaurantsListView(context),
              ],
            ),
          ),
        ),
        _buildSearch(context),
      ],
    ));
  }
}
