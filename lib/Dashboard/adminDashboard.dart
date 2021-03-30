import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smsapp/Card/selectCard.dart';
import 'package:smsapp/Pages/eventPage.dart';
import 'package:smsapp/Pages/examPage.dart';
import 'package:smsapp/Pages/feePage.dart';
import 'package:smsapp/Pages/profilePage.dart';
import 'package:smsapp/Pages/staffPage.dart';
import 'package:smsapp/Pages/studentPage.dart';
import 'package:smsapp/Pages/subjectPage.dart';
import 'package:smsapp/Pages/timetablePage.dart';
// import 'package:SMSApp/Parent/ParentPages/parentEvent.dart';
// import 'package:SMSApp/Parent/ParentPages/parentExam.dart';
// import 'package:SMSApp/Parent/ParentPages/parentLeave.dart';
// import 'package:SMSApp/Parent/ParentPages/parentProfile.dart';
// import 'package:SMSApp/Parent/ParentPages/studentAttendance.dart';
// import 'package:SMSApp/Parent/ParentPages/studentComplaint.dart';
// import 'package:SMSApp/Parent/ParentPages/studentHomework.dart';
// // import 'package:SMSApp/OTP Code/otpCode.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
                                  return SelectScreen();
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
        primary: false,
        body: SafeArea(
                  child: Container(
              // decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //         colors: [
              //       Colors.white,
              //       bHexColor('#B9E2DA').withOpacity(0.1),
              //     ])),
              height: double.infinity,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
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
                                  icon: Icon(Icons.notifications),
                                  iconSize: 30,
                                  onPressed: () {},
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
                  height: MediaQuery.of(context).size.height / 9,
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
                SizedBox(height: 80),

                //GridView

                Container(
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 30,
                            childAspectRatio: 1.2,
                            crossAxisCount: 3),
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                // color: HexColor('#B9E2DA'),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(
                                //     color: HexColor('#A7BCC7')
                                //         .withOpacity(0.9),
                                //     width: 0.8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(3, 3),
                                  )
                                ]),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 400),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return ProfilePage();
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.user,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Profile",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Libre",
                                          fontSize: 11))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                // color: HexColor('#B9E2DA'),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(
                                //     color: HexColor('#A7BCC7')
                                //         .withOpacity(0.9),
                                //     width: 0.8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(3, 3),
                                  )
                                ]),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 400),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return EventPage();
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.calendarPlus,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Event",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Libre",
                                          fontSize: 11)),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                //color: HexColor('#B9E2DA'),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(
                                //     color: HexColor('#A7BCC7')
                                //         .withOpacity(0.9),
                                //     width: 0.8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  )
                                ]),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 400),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return StudentPage();
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.userFriends,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Student",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Libre",
                                          fontSize: 11)),
                                ],
                              ),
                            ),
                          ),

                          //2nd Row

                          Container(
                            decoration: BoxDecoration(
                                // color: HexColor('#B9E2DA'),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(
                                //     color: HexColor('#A7BCC7')
                                //         .withOpacity(0.9),
                                //     width: 0.8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(3, 3),
                                  )
                                ]),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 400),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return SubjectPage();
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.bookReader,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Subject",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Libre",
                                          fontSize: 11)),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                                //color: HexColor('#B9E2DA'),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(
                                //     color: HexColor('#A7BCC7')
                                //         .withOpacity(0.9),
                                //     width: 0.8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(3, 3),
                                  )
                                ]),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 400),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return FeePage();
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.handshake,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Payment",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Libre",
                                          fontSize: 11)),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                // color: HexColor('#B9E2DA'),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(
                                //     color: HexColor('#A7BCC7')
                                //         .withOpacity(0.9),
                                //     width: 0.8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(3, 3),
                                  )
                                ]),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 400),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return StaffPage();
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.book,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Staff",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Libre",
                                          fontSize: 11)),
                                ],
                              ),
                            ),
                          ),

                          //3rd Row
                          Container(
                            decoration: BoxDecoration(
                                //  color: HexColor('#B9E2DA'),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(
                                //     color: HexColor('#A7BCC7')
                                //         .withOpacity(0.9),
                                //     width: 0.8),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(3, 3),
                                  )
                                ]),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 400),
                                      pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secondaryAnimation) {
                                        return ExamPage();
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
                                    ));
                                // );
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Icon(
                                      FontAwesomeIcons.edit,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Exam",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Libre",
                                          fontSize: 11)),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                                // color: HexColor('#B9E2DA'),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(
                                //     color: HexColor('#A7BCC7')
                                //         .withOpacity(0.9),
                                //     width: 0.8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(3, 3),
                                  )
                                ]),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 400),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return TimetablePage();
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Icon(
                                      FontAwesomeIcons.clock,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Timetable",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Libre",
                                          fontSize: 11)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 10, left: 20, right: 20),
                  // color: HexColor('#B9E2DA'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 7,
                          blurRadius: 5,
                          offset: Offset(3, 3),
                        )
                      ]),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {},
                              iconSize: 30,
                              color: HexColor("#F7A529"),
                            ),
                            Text(
                              "Menu",
                              style: TextStyle(
                                  color: HexColor("#F7A529"),
                                  fontFamily: 'Varela',
                                  fontSize: 11),
                            )
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            IconButton(
                                icon: Icon(FontAwesomeIcons.userAlt),
                                onPressed: () {},
                                iconSize: 30,
                                color: HexColor("#F7A529")),
                            Text("Profile",
                                style: TextStyle(
                                    color: HexColor("#F7A529"),
                                    fontFamily: 'Varela',
                                    fontSize: 11))
                          ],
                        )),
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.logout),
                                  onPressed: () {
                                    createAlertDialog(context);
                                  },
                                  iconSize: 30,
                                  color: HexColor("#F7A529")),
                              Text("Logout",
                                  style: TextStyle(
                                      color: HexColor("#F7A529"),
                                      fontFamily: 'Varela',
                                      fontSize: 11))
                            ],
                          ),
                        ),
                      ]),
                ),
              ])),
        ),
    );
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
