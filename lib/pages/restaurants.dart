import 'package:flutter/material.dart';

class RestaurantsPage extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
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

  Widget _buildRestaurantCard(int index) {
    return GestureDetector(
      onTap: () {
        print(restaurants[index]['title']);
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
                        restaurants[index]['image'],
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
                          restaurants[index]['title'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          restaurants[index]['type'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 11.0,
                              color: Colors.black54),
                        ),
                        Text(
                          'AED' +
                              restaurants[index]['per'].toString() +
                              ' per person',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 10.0,
                              color: Colors.grey),
                        ),
                        Text(
                          'AED' +
                              restaurants[index]['min'].toString() +
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
                    padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.lime,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      restaurants[index]['rate'].toString(),
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

    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(
            color: Colors.lime,
          ),
          borderRadius: BorderRadius.circular(5.0)),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 20.0),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Restaurants'),
        // ),
        body: Column(
      children: <Widget>[
        Container(
          // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
          child: _buildAdsListView(),
          height: 100.0,
        ),
        _buildSearch(context),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0.0, bottom: 50.0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: restaurants.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildRestaurantCard(index);
            },
          ),
        )
      ],
    ));
  }
}
