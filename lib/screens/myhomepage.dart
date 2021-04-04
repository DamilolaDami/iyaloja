import 'dart:math';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iyaloja/authmodels/authmodel.dart';
import 'package:iyaloja/models/models.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iyaloja/screens/widgets/bestselling.dart';
import 'package:iyaloja/screens/widgets/exclusivesoffers.dart';
import 'package:iyaloja/screens/widgets/topcarousel.dart';
import 'package:provider/provider.dart';
import 'package:iyaloja/screens/style/theme.dart' as Style;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  FirebaseAuth auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection("users");
  UserModel _currentUser;

  String _username;
  String _email;
  String photoUrl;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    // FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    //_bannerAd = createBannerAd()
    // ..load()
    // ..show();

    getCurrentUser();
  }

  @override
  void dispose() {
    //  _bannerAd?.dispose();
    super.dispose();
  }

  getCurrentUser() async {
    UserModel currentUser = await context
        .read<AuthenticationService>()
        .getUserFromDB(uid: auth.currentUser.uid);

    _currentUser = currentUser;

    print("${_currentUser.username}");
    print("${_currentUser.uid}");
    print("${_currentUser.photourl}");
    if (currentUser == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        _username = _currentUser.username;
        _email = _currentUser.email;
        photoUrl = _currentUser.photourl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                GestureDetector(
                    onTap: getImage,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: photoUrl == null
                                ? AssetImage('assets/images/11.png')
                                : NetworkImage(photoUrl),
                          )),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _username != null ? _username : '',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  _email != null ? _email : '',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Style.Colors.secondColor,
            ),
          ),
          ListTile(
            trailing: Icon(
              Icons.arrow_forward,
              color: Style.Colors.secondColor,
            ),
            onTap: () {},
            title: Text(
              'Home',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          ListTile(
            trailing: Icon(
              Icons.arrow_forward,
              color: Style.Colors.secondColor,
            ),
            onTap: () {},
            title: Text(
              'Checkout',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          ListTile(
            trailing: Icon(
              Icons.arrow_forward,
              color: Style.Colors.secondColor,
            ),
            onTap: () {},
            title: Text(
              'Cart',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          ListTile(
            trailing: Icon(
              Icons.arrow_forward,
              color: Style.Colors.secondColor,
            ),
            onTap: () {},
            title: Text(
              'My orders',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          ListTile(
            trailing: Icon(
              Icons.arrow_forward,
              color: Style.Colors.secondColor,
            ),
            onTap: () {},
            title: Text(
              'Settings',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          ListTile(
            trailing: Icon(
              Icons.arrow_forward,
              color: Style.Colors.secondColor,
            ),
            onTap: () {},
            title: Text(
              'About Us',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          ListTile(
            trailing: Icon(
              Icons.arrow_forward,
              color: Style.Colors.secondColor,
            ),
            onTap: () {
              context.read<AuthenticationService>().signOut();
            },
            title: Text(
              'logout',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      )),
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        title: Text(
          'Iyaloja',
          style: GoogleFonts.courgette(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          TopCarosel(),
          ExclusiveOffers(),
          // ExclusiveOffers(),
          BestSelling(),
        ],
      ),
      backgroundColor: Color(0xf4f4f4f4),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedLabelStyle: GoogleFonts.oswald(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Style.Colors.secondColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            label: 'Shop',
            icon: Icon((MaterialIcons.shop)),
          ),
          BottomNavigationBarItem(
              label: 'Explore', icon: Icon(Ionicons.ios_search)),
          BottomNavigationBarItem(label: 'Cart', icon: Icon(Ionicons.ios_cart)),
          BottomNavigationBarItem(
              label: 'Favourites', icon: Icon(MaterialIcons.favorite)),
          BottomNavigationBarItem(
              label: 'Account', icon: Icon(MaterialIcons.people_outline)),
        ],
      ),
    );
  }

  Future getImage() async {
    // Get image from gallery.
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _uploadImageToFirebase(image);
  }

  Future<void> _uploadImageToFirebase(File image) async {
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

      _addPathToDatabase(url);
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> _addPathToDatabase(String url) async {
    try {
      // Get image URL from firebase
      // final ref = FirebaseStorage.instanceFor().ref().child('profile.jpg');
      //var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_currentUser.uid)
          .update({
        'photo': url,
      });
    } catch (e) {
      print(e.message);
    }
  }
}
