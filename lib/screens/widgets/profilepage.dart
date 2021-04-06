import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:iyaloja/authmodels/authmodel.dart';

import 'package:provider/provider.dart';
import 'package:iyaloja/screens/style/theme.dart' as Style;
import 'package:sliver_fab/sliver_fab.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userRef = FirebaseFirestore.instance.collection("users");
  // UserModel _currentUser;

  // String _username;
  // String _email;
  // String photoUrl;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    // FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    //_bannerAd = createBannerAd()
    // ..load()
    // ..show();
    // getCurrentUser();
  }

  @override
  void dispose() {
    //  _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationService>(builder: (context, auth, child) {
      final user = auth.currentUser;
      return Scaffold(body: Builder(builder: (context) {
        return SliverFab(
            floatingPosition: FloatingPosition(
              left: 10,
            ),
            floatingWidget: Stack(children: [
              Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: user.photourl == null
                          ? AssetImage('assets/images/11.png')
                          : NetworkImage(user?.photourl),
                    )),
              ),
              Positioned(
                bottom: 8,
                right: 2,
                child: Container(
                  child: IconButton(
                    onPressed: () async {
                      await auth.updateImage();
                      await auth.getCurrentUser();
                    },
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange[400],
                  ),
                ),
              )
            ]),
            expandedHeight: 200,
            slivers: [
              SliverAppBar(
                title: Text(
                  'My Profile',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                ),
                centerTitle: false,
                backgroundColor: Style.Colors.secondColor,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: user.photourl == null
                                  ? AssetImage('assets/images/11.png')
                                  : NetworkImage(user.photourl),
                            )),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.black.withOpacity(0.0)
                            ])),
                      )
                    ],
                  ),
                ),
              ),
              SliverPadding(
                  padding: EdgeInsets.all(0.0),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate([
                    Padding(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 90,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user?.username,
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          user?.email,
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Icon(Ionicons.ios_settings)
                                  ],
                                ),
                              )
                            ])),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            ListTile(
                              //  hoverColor: Style.Colors.secondColor,
                              // tileColor: Style.Colors.mainColor,
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Style.Colors.mainColor,
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
                              //  hoverColor: Style.Colors.mainColor,
                              //  tileColor: Style.Colors.mainColor,
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Style.Colors.secondColor,
                              ),
                              onTap: () {},
                              title: Text(
                                'Purchase History',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            ListTile(
                              //  hoverColor: Style.Colors.mainColor,
                              //  tileColor: Style.Colors.mainColor,
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Style.Colors.secondColor,
                              ),
                              onTap: () {},
                              title: Text(
                                'My Favourites',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            ListTile(
                              //  hoverColor: Style.Colors.mainColor,
                              //  tileColor: Style.Colors.mainColor,
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Style.Colors.secondColor,
                              ),
                              onTap: () {},
                              title: Text(
                                'Change Payment Method',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            ListTile(
                              //  hoverColor: Style.Colors.mainColor,
                              //  tileColor: Style.Colors.mainColor,
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Style.Colors.secondColor,
                              ),
                              onTap: () {},
                              title: Text(
                                'Download Account Details',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            ListTile(
                              //  hoverColor: Style.Colors.mainColor,
                              //  tileColor: Style.Colors.mainColor,
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Style.Colors.secondColor,
                              ),
                              onTap: () {},
                              title: Text(
                                'Support',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            ListTile(
                              //  hoverColor: Style.Colors.mainColor,
                              //  tileColor: Style.Colors.mainColor,
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Style.Colors.secondColor,
                              ),
                              onTap: () {},
                              title: Text(
                                'Contact Us',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            ListTile(
                              //  hoverColor: Style.Colors.mainColor,
                              //  tileColor: Style.Colors.mainColor,
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Style.Colors.secondColor,
                              ),
                              onTap: () {},
                              title: Text(
                                'Log out ',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            ListTile(
                              //  hoverColor: Style.Colors.mainColor,
                              //  tileColor: Style.Colors.mainColor,
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Style.Colors.secondColor,
                              ),
                              onTap: () {},
                              title: Text(
                                'Purchase History',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            ListTile(
                              //  hoverColor: Style.Colors.mainColor,
                              //  tileColor: Style.Colors.mainColor,
                              trailing: Icon(
                                Icons.arrow_forward,
                                color: Style.Colors.secondColor,
                              ),
                              onTap: () {},
                              title: Text(
                                'Purchase History',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ])))
            ]);
      }));
    });
  }
}
