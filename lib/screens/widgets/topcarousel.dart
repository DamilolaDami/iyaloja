import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:iyaloja/screens/style/theme.dart' as Style;
import 'package:iyaloja/models/carouselmodel.dart';

class TopCarosel extends StatefulWidget {
  @override
  _TopCaroselState createState() => _TopCaroselState();
}

class _TopCaroselState extends State<TopCarosel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        child: Container(
          height: 220,
          child: PageIndicatorContainer(
            length: myCarou.length,
            align: IndicatorAlign.bottom,
            indicatorSpace: 8.0,
            padding: EdgeInsets.all(5.0),
            indicatorColor: Style.Colors.titleColor,
            indicatorSelectorColor: Style.Colors.secondColor,
            shape: IndicatorShape.circle(size: 7.0),
            pageView: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: myCarou.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: AssetImage(myCarou[index].img),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Style.Colors.mainColor.withOpacity(1.0),
                                    Style.Colors.mainColor.withOpacity(0.0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: [0.0, 0.9])),
                        ),
                        Positioned(
                          bottom: 20.0,
                          child: Container(
                            padding: EdgeInsets.only(
                              right: 20,
                            ),
                            width: 260,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      myCarou[index].title,
                                      style: GoogleFonts.lato(
                                          height: 1.5,
                                          fontWeight: FontWeight.w900,
                                          color: Style.Colors.secondColor,
                                          fontSize: 20),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ));
              },
            ),
          ),
        ));
  }
}
