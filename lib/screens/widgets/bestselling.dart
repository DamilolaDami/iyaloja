import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iyaloja/models/bestselling.dart';
import 'package:iyaloja/screens/style/theme.dart' as Style;

class BestSelling extends StatefulWidget {
  @override
  _BestSellingState createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
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
                    'Best Selling',
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
              height: 240,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bestselling.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                            onTap: () {},
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
                                                bestselling[index].img),
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
                                      bestselling[index].title,
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
