import 'package:flutter/material.dart';
import './scope-models/main.dart';
// import 'package:flutter/rendering.dart';
import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';
import './models/product.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  // final bool debugMode = true;
  // debugPaintSizeEnabled = debugMode;
  // debugPaintBaselinesEnabled = debugMode;
  // debugPaintPointersEnabled = debugMode;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Product> _products = [];
  final bool statrtWithLoginPage = true;

  @override
  void initState() {
    // test only
    // for (var i = 1; i < 8; i++) {
    //   _addProduct(Product(
    //       title: 'Restaurant Name' + i.toString(),
    //       description:
    //           'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ..... Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    //       price: (i * 5).toDouble(),
    //       image: 'assets/food-' + i.toString() + '.jpg'));
    // }

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model:MainModel(),
      child: MaterialApp(
      // debugShowMaterialGrid: true,
      title: 'Orders App',
      theme: ThemeData(
        // brightness: Brightness.light,
        primarySwatch: Colors.green,
        accentColor: Colors.lime,
        fontFamily: 'Cairo',
        buttonColor: Colors.red,
      ),

      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) =>
            statrtWithLoginPage == true ? AuthPage() : ProductsPage(),
        '/products': (BuildContext context) => ProductsPage(),
        '/admin': (BuildContext context) => ProductsAdminPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElement = settings.name.split('/');

        if (pathElement[0] != '') {
          return null;
        }

        if (pathElement[1] == 'product') {
          final int index = int.parse(pathElement[2]);

          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(index),
          );
        }

        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage());
      },
    ));
  }
}
