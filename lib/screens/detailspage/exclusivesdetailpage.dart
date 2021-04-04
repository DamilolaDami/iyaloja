import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iyaloja/models/exclusiveorders.dart';
import 'package:iyaloja/screens/style/theme.dart' as Style;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ExclusivesDetailsPage extends StatefulWidget {
  final ExclusiveOrders exclusivess;
  ExclusivesDetailsPage({Key key, @required this.exclusivess})
      : super(key: key);
  @override
  _ExclusivesDetailsPageState createState() =>
      _ExclusivesDetailsPageState(exclusivess);
}

class _ExclusivesDetailsPageState extends State<ExclusivesDetailsPage> {
  final ExclusiveOrders exclusivess;
  _ExclusivesDetailsPageState(this.exclusivess);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  appBar: AppBar(),
        body: ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Center(
                          child: IconButton(
                        icon: Icon(
                          AntDesign.arrowleft,
                          size: 16,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Style.Colors.secondColor,
                      ),
                    ),
                    Container(
                      child: Center(
                          child: IconButton(
                        icon: Icon(
                          AntDesign.download,
                          size: 16,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          //  Navigator.pop(context);
                        },
                      )),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Style.Colors.secondColor,
                      ),
                    )
                  ],
                )),
            height: 240,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(exclusivess.img))),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    exclusivess.title,
                    style: GoogleFonts.lato(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Icon(
                    Icons.favorite_rounded,
                    color: Style.Colors.secondColor,
                  )
                ],
              )),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Text(
              'Product Details',
              style: GoogleFonts.alata(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Text(
              exclusivess.productdetails,
              style: GoogleFonts.alata(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nutrition',
                  style: GoogleFonts.alata(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '100gr',
                  style: GoogleFonts.alata(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews',
                  style: GoogleFonts.alata(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                RatingBar.builder(
                  itemSize: 16,
                  initialRating: 4,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Style.Colors.secondColor,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 21,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add To Cart',
                  style: GoogleFonts.alata(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Ionicons.ios_cart,
                  color: Colors.white,
                )
              ],
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              //  borderRadius: BorderRadius.circular(10),
              color: Style.Colors.secondColor,
            ),
          )
        ],
      ),
    ]));
  }
}
