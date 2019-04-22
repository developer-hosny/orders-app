import 'package:flutter/material.dart';
// import 'package:layout_demo_flutter/layout_type.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import '../scope-models/main.dart';

class HeroHeader implements SliverPersistentHeaderDelegate {
  HeroHeader({
    // this.layoutGroup,
    this.onLayoutToggle,
    this.minExtent,
    this.maxExtent,
  });
  // final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;
  double maxExtent;
  double minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'assets/food.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 4.0,
          top: 4.0,
          child: SafeArea(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onLayoutToggle,
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Text(
            'Al Bait Al Malaki Mandi',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

class ProductsPage extends StatefulWidget {
  MainModel model = MainModel();
  ProductsPage(this.model);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  _ProductsPageState({Key key, this.onLayoutToggle});
  // final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;
  List<int> _itemCount = new List<int>.generate(100, (i) => 0);
  double totalPrice = 0.0;

  @override
  void initState() {
    print('selectedRestaurantIndex' + widget.model.selectedRestaurantIndex.toString());
    widget.model.fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      body: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return Hero(
            transitionOnUserGestures: false,
            tag: 'productHero',
            child: Stack(
              children: <Widget>[
                _scrollView(context, model.displayedProducts, model),
                _showShoppingCart(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
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

  Widget _showShoppingCart(BuildContext context) {
    return Positioned(
        bottom: 0.0,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: totalPrice > 0 ? 60.0 : 0.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.lime,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              Text(
                'AED' + totalPrice.toString(),
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ));
  }

  void calcOrder(int index, String addOrRemove, price) {
    // List<Product> products;

    if (addOrRemove == '++') {
      setState(() {
        _itemCount[index]++;
        totalPrice += price;
      });
    } else {
      setState(() {
        _itemCount[index]--;
        totalPrice -= price;
      });
    }
  }

  Widget _scrollView(BuildContext context, List<Product> products, model) {
    // Use LayoutBuilder to get the hero header size while keeping the image aspect-ratio
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: HeroHeader(
              // layoutGroup: layoutGroup,
              onLayoutToggle: onLayoutToggle,
              minExtent: 150.0,
              maxExtent: 250.0,
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ListTile(
                key: Key(products[index].title),
                title: Text(
                  products[index].title,
                  style: TextStyle(
                      fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                ),
                subtitle: Text('AED' + products[index].price.toString()),
                trailing: Container(
                  width: 125,
                  height: 30.0,
                  decoration: BoxDecoration(
                    // color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.lime, width: 1.0),
                  ),
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _itemCount[index] < 1
                          ? Container(
                              margin: EdgeInsets.only(left: 30.0),
                              child: Text(
                                'Add',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.lightGreen),
                              ))
                          : IconButton(
                              iconSize: 12.0,
                              icon: Icon(Icons.remove),
                              color: Colors.lightGreen,
                              onPressed: () =>
                                  calcOrder(index, '--', products[index].price),
                            ),
                      _itemCount[index] > 0
                          ? Container(
                              padding: EdgeInsets.symmetric(horizontal: 3.0),
                              decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Text(
                                _itemCount[index] < 1
                                    ? ''
                                    : _itemCount[index].toString(),
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : Container(),
                      IconButton(
                        iconSize: 12.0,
                        icon: Icon(Icons.add),
                        color: Colors.lightGreen,
                        onPressed: () =>
                            calcOrder(index, '++', products[index].price),
                      )
                    ],
                  ),
                ),
              );
            }, childCount: products.length),
          )
        ],
      ),
    );
  }
}
