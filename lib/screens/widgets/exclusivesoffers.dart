import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iyaloja/models/exclusiveorders.dart';
import 'package:iyaloja/screens/detailspage/exclusivesdetailpage.dart';
import 'package:iyaloja/screens/style/theme.dart' as Style;

class ExclusiveOffers extends StatefulWidget {
  @override
  _ExclusiveOffersState createState() => _ExclusiveOffersState();
}

class _ExclusiveOffersState extends State<ExclusiveOffers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exclusive Offers',
                    style: GoogleFonts.lato(
                      height: 1.7,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'See All',
                    style: GoogleFonts.lato(
                      height: 1.7,
                      color: Style.Colors.secondColor,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              )),
          Container(
              height: 224,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exclusives.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ExclusivesDetailsPage(
                                            exclusivess: exclusives[index],
                                          )));
                            },
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(children: [
                                    Container(
                                      width: 120,
                                      height: 170,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                exclusives[index].img),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Positioned(
                                      bottom: 2,
                                      right: 4,
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color: Style.Colors.secondColor,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 1.1,
                                  ),
                                  Container(
                                    child: Text(
                                      exclusives[index].title,
                                      maxLines: 2,
                                      style: GoogleFonts.lato(
                                        height: 1.7,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ])));
                  }))
        ],
      ),
    );
  }
}
