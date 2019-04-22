import 'package:flutter/material.dart';

class OfferArea extends StatelessWidget {
  
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


  @override
  Widget build(BuildContext context) {
    return _buildOffersArea();
  }

}