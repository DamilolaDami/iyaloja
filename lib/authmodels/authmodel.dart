import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iyaloja/models/models.dart';

class AuthenticationService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  UserModel currentUser;
  final userRef = FirebaseFirestore.instance.collection("users");

  AuthenticationService(this._firebaseAuth);

  // managing the user state via stream.
  // stream provides an immediate event of
  // the user's current authentication state,
  // and then provides subsequent events whenever
  // the authentication state changes.
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  //1
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return "Signed In";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        return "Wrong password provided for that user.";
      } else {
        return "Something Went Wrong.";
      }
    }
  }

  //2
  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        return "The account already exists for that email.";
      } else {
        return "Something Went Wrong.";
      }
    } catch (e) {
      print(e);
    }
  }

  //3
  Future<void> addUserToDB(
      {String uid, String username, String email, DateTime timestamp}) async {
    final userModel = UserModel(
        uid: uid, username: username, email: email, timestamp: timestamp);

    await userRef.doc(uid).set(userModel.toMap(userModel));
  }

  //4
  Future<UserModel> getUserFromDB({String uid}) async {
    final DocumentSnapshot doc = await userRef.doc(uid).get();

    // return(doc.data());

    return UserModel.fromMap(doc.data());
  }

  //5
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  getCurrentUser() async {
    print('USER IDE IS => ${_firebaseAuth.currentUser.uid}');
    final user = await getUserFromDB(uid: _firebaseAuth.currentUser.uid);
    if (user == null) {
      print('cannot get user at the moment');
    } else {
      currentUser = user;
      print("${currentUser.username}");
      print("${currentUser.uid}");
      print("${currentUser.photourl}");
      notifyListeners();
    }
  }

  Future<void> updateImage() async {
    // Get image from gallery.
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    // _uploadImageToFirebase(image);

    // Future<void> _uploadImageToFirebase(File image) async {
    try {
      // Make random image name.
      int randomNumber = Random().nextInt(100000);
      String imageLocation = 'images/image$randomNumber.jpg';

      // Upload image to firebase.
      final storageReference =
          FirebaseStorage.instanceFor().ref().child(imageLocation);
      final uploadTask = storageReference.putFile(image);
      await uploadTask;
      final url = await storageReference.getDownloadURL();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser.uid)
          .update({
        'photo': url,
      });
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> _deleteImage() async {
    
  }
  // Future<void> _addPathToDatabase(String url) async {
  // try {
  //   // Get image URL from firebase
  //   // final ref = FirebaseStorage.instanceFor().ref().child('profile.jpg');
  //   //var imageString = await ref.getDownloadURL();

  //   // Add location and url to database

  // } catch (e) {
  //   print(e.message);
  // }
  // }
}
