import 'dart:math';

import 'package:scoped_model/scoped_model.dart';
import './connected_products.dart';
import './connected_restaurants.dart';

class MainModel extends Model with ConnectedRestaurantsModel, ConnectedProductsModel, UserModel, ProductsModel, RestaurantsModel {

  MainModel(){
    _addRestaurantsForTest();
     _addProductsForTest();
  }

    _addRestaurantsForTest() {
      List<RestaurantsModel> restaurants;
    if (restaurants == null) {
      for (var i = 0; i < 10; i++) {
        this.addRestaurant(
          'Al Bait Al Malaki Mandi',
          'mandy, mazbi, madfon',
          'description mandy, mazbi, madfon',
          20.0,
          100.0,
          4.2,
          'assets/food-1.jpg',
        );

        this.addRestaurant(
          'Falafil Faryha Cfetria',
          'Lebnanese, Arabian, Pizza, Grill',
          'description Lebnanese, Arabian, Pizza, Grill',
          20.0,
          100.0,
          4.2,
          'assets/food-2.jpg',
        );
      }
    }
  }
    _addProductsForTest() {
    // String title, String description, String image, double price
    List<ProductsModel> products;
    if (products == null) {
      bool x = false;
      for (var i = 0; i < 50; i++) {
        String img = x == true ? '1' : '2';
        x = !x;

        final _random = new Random();
        int next(int min, int max) => min + _random.nextInt(max - min);

        this.addProduct('Product ' + i.toString(), 'Product description',
            'assets/food-' + img + '.jpg', next(5, 100).toDouble());
        // _itemCount.add(0);
      }
      // addProductsForTest = true;
    }
  }

}
