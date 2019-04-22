import 'package:flutter/material.dart';

class AdsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
