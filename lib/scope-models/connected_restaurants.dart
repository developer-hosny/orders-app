import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orders_app/scope-models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/restaurant.dart';
// import '../models/user.dart';

mixin ConnectedRestaurantsModel on Model {
  List<Restaurant> _restaurants = [];

  void addRestaurant(
      String uid,
      String userEmail,
      String title,
      String type,
      String description,
      double min,
      double max,
      String phone,
      String address,
      String image,
      MainModel model) async {
    // model.addRestaurant(_form['title'], _form['type'], _form['description'], _form['min'], _form['max'],_form['phone'],_form['address'], _form['image']);

    // final Restaurant newRestaurant = Restaurant(
    //     title: title,
    //     type: type,
    //     description: description,
    //     per: per,
    //     min: min,
    //     rate: rate,
    //     image: image,
    //     userEmail: 'a@a.com',
    //     userId: '1'
    //     // userEmail: _authenticatedUser.email,
    //     // userId: _authenticatedUser.id
    //     );

    Map<String, dynamic> newRestaurant = {
      'userId': uid,
      'userEmail': userEmail,
      'title': title,
      'type': type,
      'description': description,
      'min': min,
      'max': max,
      'phone': phone,
      'address': address,
      'image': image,
      // userEmail: _authenticatedUser.email,
      // userId: _authenticatedUser.id
    };
    // String _doc;
    DocumentReference docRef =
        await Firestore.instance.collection('restaurants').add(newRestaurant);
    updateResturantData(docRef, model);
    notifyListeners();

    // _restaurants.add(newRestaurant);
  }

  void fetchRestaurants() {
    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    final List<Restaurant> fetechedRestaurantsList = [];

    Firestore.instance
        .collection('restaurants')
        // .where("title", isEqualTo: "Product 00")
        .snapshots()
        .listen((data) {
      fetechedRestaurantsList.clear();
      data.documents.forEach((doc) {
        final Restaurant product = Restaurant(
            id: doc['id'],
            title: doc['title'],
            type: doc['type'],
            description: doc['description'],
            image: doc['image'],
            min: doc['min'],
            max: doc['max'],
            phone: doc['phone'],
            address: doc['address'],
            userEmail: 'a@a.com',
            userId: '11');

        fetechedRestaurantsList.add(product);
      });
      _restaurants = fetechedRestaurantsList;
      notifyListeners();
    });
  }

  void updateResturantData(DocumentReference doc, MainModel model) async {
    print(doc);
    print(doc.documentID);
    DocumentReference ref =
        Firestore.instance.collection('restaurants').document(doc.documentID);
    return ref.setData({
      // 'uid': model.authenticatedUser.id,
      'id': doc.documentID,
      // 'userEmail': model.authenticatedUser.email,
      // 'title': restaurant.title,
      // // 'photoURL': user.photoUrl,
      // // 'displayName': user.displayName,
      // 'lastSeen': DateTime.now(),
    }, merge: true);
  }
}

mixin RestaurantsModel on ConnectedRestaurantsModel {
  int _selRestaurantIndex;

  List<Restaurant> get allRestaurants {
    return List.from(_restaurants);
  }

  void selectRestaurant(int index) {
    _selRestaurantIndex = index;
    if (index != null) {
      notifyListeners();
    }
  }

  int get selectedRestaurantIndex {
    return _selRestaurantIndex;
  }

  Restaurant get selectedRestaurant {
    if (selectedRestaurantIndex == null) return null;

    return _restaurants[selectedRestaurantIndex];
  }
}
