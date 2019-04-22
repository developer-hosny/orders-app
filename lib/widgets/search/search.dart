import 'package:flutter/material.dart';

class SearchArea extends StatefulWidget {
  BuildContext _context;
  SearchArea(this._context);

  @override
  _SearchAreaState createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
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

  void _toggleDrawerMenu(BuildContext context) {
    Scaffold.of(context).openDrawer();
    // _toggleDrawer == false
    //     ? Scaffold.of(context).openDrawer()
    //     :(_);
    // _toggleDrawer = !_toggleDrawer;
  }

  @override
  Widget build(BuildContext context) {
    return _buildSearch(context);
  }
}
