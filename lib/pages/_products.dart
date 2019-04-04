// import 'package:flutter/material.dart';
// import '../widgets/products/products_list.dart';
// import 'package:scoped_model/scoped_model.dart';
// import '../scope-models/main.dart';

// import '../models/product.dart';

// class ProductsPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _ProductsPageState();
//   }
// }

// class _ProductsPageState extends State<ProductsPage> {
//   bool addProductsForTest = false;
//   List<Product> products;

//   Widget _buildSideDrawer(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: <Widget>[
//           AppBar(
//             automaticallyImplyLeading: false,
//             title: Text('Choose'),
//           ),
//           ListTile(
//             leading: Icon(Icons.edit),
//             title: Text('Manage Products'),
//             onTap: () => {
//                   Navigator.pushReplacementNamed(context, '/admin'),
//                 },
//           ),
//         ],
//       ),
//     );
//   }

//   _addProductsForTest(model) {
//     // String title, String description, String image, double price
//     if (!addProductsForTest) {
//       bool x = false;
//       for (var i = 0; i < 10; i++) {
//         String img = x == true ? '1' : '2';
//         x = !x;
//         model.addProduct('Product ' + i.toString(), 'Product description',
//             'assets/food-' + img + '.jpg', 2.0);
//       }
//       addProductsForTest = true;
//     }
//   }

//   Widget _buildHeroHeader() {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Image.asset(
//           'assets/ronnie-mayo-361348-unsplash.jpg',
//           fit: BoxFit.cover,
//         ),
//         Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Colors.transparent,
//                 Colors.black54,
//               ],
//               stops: [0.5, 1.0],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               tileMode: TileMode.repeated,
//             ),
//           ),
//         ),
//         Positioned(
//           left: 4.0,
//           top: 4.0,
//           child: SafeArea(
//             child: IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {},
//             ),
//           ),
//         ),
//         Positioned(
//           left: 16.0,
//           right: 16.0,
//           bottom: 16.0,
//           child: Text(
//             'Hero Image',
//             style: TextStyle(fontSize: 32.0, color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _scrollView(BuildContext context) {
//     // Use LayoutBuilder to get the hero header size while keeping the image aspect-ratio
//     return Container(
//       child: CustomScrollView(
//         slivers: <Widget>[
//           SliverPersistentHeader(
//             pinned: true,
//             // delegate: _buildHeroHeader(
//             //   layoutGroup: layoutGroup,
//             //   onLayoutToggle: onLayoutToggle,
//             //   minExtent: 150.0,
//             //   maxExtent: 250.0,
//             // ),
//           ),
//           SliverGrid(
//             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 200.0,
//               mainAxisSpacing: 0.0,
//               crossAxisSpacing: 0.0,
//               childAspectRatio: 0.75,
//             ),
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return Container(
//                     alignment: Alignment.center,
//                     padding: _edgeInsetsForIndex(index),
//                     color: Colors.red,
//                     height: 100.0,
//                     width: 100.0,
//                     child: Text('x')
//                     //   ListTile(
//                     //   title: Text(products[index].title),
//                     // )
//                     );
//               },
//               childCount: products.length,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   EdgeInsets _edgeInsetsForIndex(int index) {
//     if (index % 2 == 0) {
//       return EdgeInsets.only(top: 4.0, left: 8.0, right: 4.0, bottom: 4.0);
//     } else {
//       return EdgeInsets.only(top: 4.0, left: 4.0, right: 8.0, bottom: 4.0);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         drawer: _buildSideDrawer(context),
//         body: ScopedModelDescendant(
//             builder: (BuildContext context, Widget child, MainModel model) {
//           _addProductsForTest(model);
//           _scrollView(context);
//         })
        
//         // appBar: AppBar(
//         //   actions: <Widget>[
//         //     ScopedModelDescendant(
//         //         builder: (BuildContext context, Widget child, MainModel model) {
//         //        _addProductsForTest(model);

//         //       return IconButton(
//         //         icon: Icon(model.displayFavoritesOnly
//         //             ? Icons.favorite
//         //             : Icons.favorite_border),
//         //         onPressed: () {
//         //           model.toggleDisplayMode();
//         //         },
//         //       );
//         //     })
//         //   ],
//         // ),

//         // body: GestureDetector(
//         //   behavior: HitTestBehavior.opaque,
//         //   onTap: () {
//         //     FocusScope.of(context).requestFocus(new FocusNode());
//         //   },
//         //   child: Column(mainAxisSize: MainAxisSize.max, children: [
//         //     ScopedModelDescendant(
//         //         builder: (BuildContext context, Widget child, MainModel model) {
//         //       _addProductsForTest(model);
//         //       return Text('');
//         //       // return IconButton(
//         //       //   icon: Icon(model.displayFavoritesOnly
//         //       //       ? Icons.favorite
//         //       //       : Icons.favorite_border),
//         //       //   onPressed: () {
//         //       //     model.toggleDisplayMode();
//         //       //   },
//         //       // );
//         //     }),
//         //     Expanded(
//         //       flex: 1,
//         //       child:
//         //       Row(
//         //         // mainAxisAlignment: MainAxisAlignment.center,
//         //         // crossAxisAlignment: CrossAxisAlignment.stretch,
//         //         mainAxisSize: MainAxisSize.max,
//         //         children: <Widget>[
//         //           Row(
//         //             // fit: StackFit.,
//         //             children: <Widget>[
//         //               // Image.asset('assets/food-2.jpg'),
//         //               Container(
//         //                   color: Colors.blue,
//         //                   child: Row(
//         //                     mainAxisSize: MainAxisSize.max,
//         //                     crossAxisAlignment: CrossAxisAlignment.center,
//         //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //                     children: <Widget>[
//         //                       Container(
//         //                           color: Colors.green,
//         //                           child: Icon(
//         //                             Icons.arrow_back,
//         //                             color: Colors.red,
//         //                           )),
//         //                       Container(
//         //                           color: Colors.yellow,
//         //                           child: Icon(
//         //                             Icons.share,
//         //                             color: Colors.red,
//         //                           )),
//         //                     ],
//         //                   )),
//         //             ],
//         //           ),
//         //         ],
//         //       ),
//         //     ),
//         //     Expanded(
//         //       flex: 3,
//         //       child: Products(),
//         //     ),
//         //     // TextField(focusNode: myFocusNode),
//         //   ]),
//         // ),
//         );
//   }
// }
