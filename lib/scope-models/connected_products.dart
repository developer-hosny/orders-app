import 'package:flutter/material.dart';
import 'package:orders_app/scope-models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import '../models/user.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

mixin ConnectedProductsModel on Model {
  List<Product> _products = [];
  // User _authenticatedUser;
  int _selProductIndex;

  void addProduct(MainModel model,
      String title, String description, String image, double price) {
      // MainModel model = MainModel();
      print('>>>>>>>> '+ model.authenticatedUser.id.toString());
      String restaurantId;
    Firestore.instance
        .collection('restaurants')
        .where("userId", isEqualTo: model.authenticatedUser.id)
        .snapshots()
        .listen((data) {
      data.documents.forEach((doc) {
        // print(doc.documentID);
        restaurantId = doc['id'];
      });
    });

    Map<String, dynamic> productData = {
      'restaurantId': restaurantId,
      'title': title,
      'description': description,
      'image': 'http://www.webdo.tn/wp-content/uploads/2017/10/kfc.jpg',
      'price': price,
    };

    Firestore.instance.collection('products').document().setData(productData);

    notifyListeners();
  }
}

mixin ProductsModel on ConnectedProductsModel {
  bool _showFavorites = false;

  List<Product> get allProducts {
    // StreamBuilder<QuerySnapshot>(
    //     stream: Firestore.instance.collection('products').snapshots(),
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
    //       switch (snapshot.connectionState) {
    //         case ConnectionState.waiting:
    //           return new Text('Loading...');
    //         default:
    //           return Container();
    //       }
    //     });
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return List.from(
          _products.where((Product product) => product.isFavorite));
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) return null;

    return _products[selectedProductIndex];
  }

  void updateProduct(
      String id, String title, String description, String image, double price) {
    final Product updatedProduct = Product(
        id: id,
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);

    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
    notifyListeners();
  }

  void toggelProductFavoriteStatus() {
    final bool isCurrentlyFavorite = _products[selectedProductIndex].isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updateProduct = Product(
        id: selectedProduct.id,
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        isFavorite: newFavoriteStatus,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);

    _products[selectedProductIndex] = updateProduct;

    notifyListeners();
  }

  void selectProduct(int index) {
    _selProductIndex = index;
    if (index != null) {
      notifyListeners();
    }
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }

  void fetchProducts() {
    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    final List<Product> fetechedProductsList = [];

    MainModel model = MainModel();

    Firestore.instance
        .collection('products')
        .where("restaurantId", isEqualTo: model.selectedRestaurantIndex)
        .snapshots()
        .listen((data) {
      data.documents.forEach((doc) {
        // print(">>>>>>>>> " + doc["title"].toString());
        final Product product = Product(
          id: doc['id'],
          restaurantId: doc['restaurantId'],
          title: doc['title'],
          description: doc['description'],
          image: doc['image'],
          price: doc['price'],
          userEmail: 'a@a.com',
          userId: '11',
        );
        fetechedProductsList.add(product);
      });
      _products = fetechedProductsList;
      notifyListeners();
    });
  }
}

// mixin UserModel on ConnectedProductsModel {
//   void updateScopedUserData(String id, String email) {
//     _authenticatedUser = User(id: id, email: email);
//     print('_authenticatedUser >>>>>>>>>> ' + authenticatedUser.email.toString());
//     notifyListeners();
//   }

//   User get authenticatedUser{
//     return _authenticatedUser;
//   }

// }
