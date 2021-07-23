import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smsapp/features/Login/loginPage.dart';
import 'package:smsapp/features/Sponsor/sponsorGrowth.dart';
import 'package:smsapp/features/Sponsor/sponsorPayments.dart';
import 'package:smsapp/features/Sponsor/sponsorProfile.dart';

class SponsorDashboard extends StatefulWidget {
  @override
  _SponsorDashboardState createState() => _SponsorDashboardState();
}

class _SponsorDashboardState extends State<SponsorDashboard> {
  bool value = false;
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 120,
              width: 30,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text("Do you really want to Log out?"),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: Text("yes"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 400),
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  return LoginPage();
                                },
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child) {
                                  return Align(
                                    child: SlideTransition(
                                      position: Tween(
                                              begin: Offset(0.0, 1.0),
                                              end: Offset(0.0, 0.0))
                                          .animate(animation),
                                      child: child,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            primary: Colors.white,
                            // shadowColor: Colors.red,
                            elevation: 5,
                          ),
                          // color: Colors.red,
                        ),
                        TextButton(
                          child: Text("No"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            primary: Colors.white,
                            // shadowColor: Colors.red,
                            elevation: 5,
                          ),
                          // color: Colors.greenAccent,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter,
        //         colors: [
        //       Colors.white,
        //       HexColor('#B9E2DA').withOpacity(0.1),
        //     ])),
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: TopClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          HexColor("#FFCC00"),
                          HexColor('#F7A529')
                        ])),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Row(
                        //   mainAxisAlignment:
                        //       MainAxisAlignment.center,
                        //   children: [
                        Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.logout),
                              iconSize: 26,
                              onPressed: () {
                                createAlertDialog(context);
                              },
                              color: Colors.black,
                            )),
                        Column(
                          children: [
                            Text("Welcome !",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontFamily: 'Varela')),
                            Text(
                              "St.Horizon School",
                              style: TextStyle(
                                  fontFamily: "Varela",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),

                        //   ],
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            // SizedBox(height: 5),

            Container(
              decoration: BoxDecoration(
                  color: HexColor('#B9E2DA'),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return SponsorProfile();
                              },
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return Align(
                                  child: SlideTransition(
                                    position: Tween(
                                            begin: Offset(1.0, 0.0),
                                            end: Offset(0.0, 0.0))
                                        .animate(animation),
                                    child: child,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: HexColor("#F7A529"), width: 1),
                              ),
                              child: Icon(
                                FontAwesomeIcons.userAlt,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Profile",
                              style:
                                  TextStyle(fontFamily: "Varela", fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                         onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return SponsorGrowth();
                              },
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return Align(
                                  child: SlideTransition(
                                    position: Tween(
                                            begin: Offset(1.0, 0.0),
                                            end: Offset(0.0, 0.0))
                                        .animate(animation),
                                    child: child,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                                              child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: HexColor("#F7A529"), width: 1),
                              ),
                              child: Icon(FontAwesomeIcons.chartBar,
                                  size: 35, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Growth",
                              style:
                                  TextStyle(fontFamily: "Varela", fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return SponsorPayments();
                              },
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return Align(
                                  child: SlideTransition(
                                    position: Tween(
                                            begin: Offset(1.0, 0.0),
                                            end: Offset(0.0, 0.0))
                                        .animate(animation),
                                    child: child,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: HexColor("#F7A529"), width: 1),
                              ),
                              child: Icon(
                                FontAwesomeIcons.dollarSign,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Payment",
                              style:
                                  TextStyle(fontFamily: "Varela", fontSize: 13),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(height: 50),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ]),
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                "Jame Doe Statistics",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Rubik"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Container(
                                    height: 180,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                              SizedBox(height: 10),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: InkWell(
                                       onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return SponsorGrowth();
                              },
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return Align(
                                  child: SlideTransition(
                                    position: Tween(
                                            begin: Offset(0.0, 1.0),
                                            end: Offset(0.0, 0.0))
                                        .animate(animation),
                                    child: child,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                                                                          child: Text(
                                        "View",
                                        style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            fontFamily: "Varela",
                                            fontWeight: FontWeight.w500,
                                            color: HexColor("#F7A529")),
                                      ),
                                    ),
                                  ))
                            ],
                          )),
                    ),
                    SizedBox(height: 50),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ]),
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                "Payment History",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Rubik"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Container(
                                    height: 180,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                              SizedBox(height: 10),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            transitionDuration:
                                                Duration(milliseconds: 400),
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation) {
                                              return SponsorPayments();
                                            },
                                            transitionsBuilder:
                                                (BuildContext context,
                                                    Animation<double> animation,
                                                    Animation<double>
                                                        secondaryAnimation,
                                                    Widget child) {
                                              return Align(
                                                child: SlideTransition(
                                                  position: Tween(
                                                          begin:
                                                              Offset(0.0, 1.0),
                                                          end: Offset(0.0, 0.0))
                                                      .animate(animation),
                                                  child: child,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "View",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontFamily: "Varela",
                                            fontWeight: FontWeight.w500,
                                            color: HexColor("#F7A529")),
                                      ),
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);

    path.quadraticBezierTo(
        size.width / 6, size.height - 50, size.width / 4, size.height - 20);
    // path.quadraticBezierTo(
    //     size.width / 4, size.height, size.width / 1.5, size.height + 20);
    path.quadraticBezierTo(
        size.width * 0.25, size.height + 10, size.width * .5, size.height - 30);
    path.lineTo(size.width / 2, size.height - 30);
    path.quadraticBezierTo(size.width - (size.width / 5), size.height,
        size.width, size.height - 50);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
