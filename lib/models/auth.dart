// // import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:orders_app/scope-models/main.dart';
// import 'package:rxdart/rxdart.dart';

// class AuthService {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final Firestore _db = Firestore.instance;

//   Observable<FirebaseUser> user;
//   Observable<Map<String, dynamic>> profile;
//   PublishSubject loading = PublishSubject();

//   AuthService() {
//     user = Observable(_firebaseAuth.onAuthStateChanged);
//     profile = user.switchMap((FirebaseUser u) {
//       if (u != null) {
//         return _db
//             .collection('users')
//             .document(u.uid)
//             .snapshots()
//             .map((snap) => snap.data);
//       } else {
//         return Observable.just({});
//       }
//     });
//   }

//   Future<String> signIn(String email, String password) async {
//     loading.add(true);
//     try {
//       FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//       updateUserData(user);
//       print('user SignedIn >>>>' + user.uid);
//       loading.add(false);
//       return 'Logged in successfully';
//     } catch (e) {
//       loading.add(false);
//       print('Error >>>>>>>>>> ' + e.message.toString());
//       return e.message.toString();
//     }
//   }

//   Future<String> signUp(String email, String password) async {
//     loading.add(true);

//     try {
//       FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
//           email: email, password: password);

//       updateUserData(user);
//       print('user SignedUp >>>>' + user.uid);
//       loading.add(false);

//       // Map<String, bool> msg = 'Your account has been created successfuly.';
//       // return msg;
//       // User({
//       //   id: user.uid,
//       //   email: user.email.toString(),
//       // });

//       return 'your account has been created successfully.'; //user.uid.toString();
//     } catch (e) {
//       loading.add(false);
//       print('Error >>>>>>>>>> ' + e.message.toString());
//       return e.message.toString();
//     }
//   }

//   // Future<String> getCurrentUser() async {
//   //   FirebaseUser user = await _firebaseAuth.currentUser();
//   //   return user.uid;
//   // }

//   Future<void> signOut() async {
//     return _firebaseAuth.signOut();
//   }

//   Future<FirebaseUser> googleSignIn() async {
//     loading.add(true);
//     GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//     GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     final FirebaseUser user =
//         await _firebaseAuth.signInWithCredential(credential).then((user){
//           updateUserData(user);
//         });
//     assert(user.email != null);
//     assert(user.displayName != null);
//     assert(!user.isAnonymous);
//     assert(await user.getIdToken() != null);

    
//     print('User SignedIn');
//     loading.add(false);
//     return user;
//   }

//   void updateUserData(FirebaseUser user) async {
//     // MainModel model = MainModel();
//     // model.updateScopedUserData(user.uid, user.email);

//     DocumentReference ref = _db.collection('users').document(user.uid);
//     return ref.setData({
//       'uid': user.uid,
//       'email': user.email,
//       'photoURL': user.photoUrl,
//       'displayName': user.displayName,
//       'lastSeen': DateTime.now(),
//     }, merge: true);
//   }

//   // void signOut() {
//   //   _firebaseAuth.signOut();
//   // }
// }

// final AuthService authService = AuthService();
