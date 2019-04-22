import 'package:flutter/material.dart';
import 'package:orders_app/scope-models/main.dart';

class CardList extends StatefulWidget {
  BuildContext _context;
  MainModel _model;
  CardList(this._context, this._model);
  
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
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

  Widget _buildRestaurantCard(
      BuildContext context, int index, MainModel model) {
    return GestureDetector(
      onTap: () {
        // print(model.allRestaurants[index].title);
        model.selectRestaurant(index);
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
                      child: Image.network(
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
                          model.allRestaurants[index].title.substring(
                              0,
                              model.allRestaurants[index].title.length > 19
                                  ? 20
                                  : model.allRestaurants[index].title.length),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          model.allRestaurants[index].type.substring(
                              0,
                              model.allRestaurants[index].type.length > 19
                                  ? 20
                                  : model.allRestaurants[index].type.length),
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
                                  model.allRestaurants[index].min.toString() +
                                  ' Min person',
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
                                  model.allRestaurants[index].max.toString() +
                                  ' Max order',
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
                      model.allRestaurants[index].rate != null
                          ? model.allRestaurants[index].rate.toString()
                          : '-',
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

  @override
  Widget build(BuildContext context) {
    return _buildRestaurantsListView(widget._context, widget._model);
  }
}