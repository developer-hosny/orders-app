import 'package:scoped_model/scoped_model.dart';
import '../models/restaurant.dart';
// import '../models/user.dart';

mixin ConnectedRestaurantsModel on Model {
  List<Restaurant> _restaurants = [];
  
  void addRestaurant(String title, String type, String description, double per,
      double min, double rate, String image) {
    final Restaurant newRestaurant = Restaurant(
        title: title,
        type: type,
        description: description,
        per: per,
        min: min,
        rate: rate,
        image: image,
        userEmail: 'a@a.com',
        userId: '1'
        // userEmail: _authenticatedUser.email,
        // userId: _authenticatedUser.id
        );
    _restaurants.add(newRestaurant);
    notifyListeners();
  }
}

mixin RestaurantsModel on ConnectedRestaurantsModel {
  List<Restaurant> get allRestaurants {
    return List.from(_restaurants);
  }
}
