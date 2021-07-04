import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smsapp/BLoc/UserInformation.dart';
import 'package:smsapp/CustomWidget/TileButton.dart';
import 'package:smsapp/features/Admin/presentation/pages/admin_event_page.dart';
import 'package:smsapp/features/Admin/presentation/pages/admin_exam_page.dart';
import 'package:smsapp/features/Admin/presentation/pages/admin_fee_page.dart';
import 'package:smsapp/features/Admin/presentation/pages/admin_staff_page.dart';
import 'package:smsapp/features/Admin/presentation/pages/admin_student_page.dart';
import 'package:smsapp/features/Admin/presentation/pages/admin_subject_page.dart';
import 'package:smsapp/features/Admin/presentation/pages/admin_timetable_page.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_event_body.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_profile_body.dart';
import 'package:smsapp/features/Card/presentation/pages/choose_user_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smsapp/features/Teacher/TeacherPages/teacherAttendance.dart';
import 'package:smsapp/features/Teacher/TeacherPages/teacherEvent.dart';
import 'package:smsapp/features/Teacher/TeacherPages/teacherHomework.dart';
import 'package:smsapp/features/Teacher/TeacherPages/teacherLeave.dart';
import 'package:smsapp/features/Teacher/TeacherPages/teacherProfile.dart';

class AdminDashboardBody extends StatefulWidget {
  @override
  _AdminDashboardBodyState createState() => _AdminDashboardBodyState();
}

class _AdminDashboardBodyState extends State<AdminDashboardBody> {
  bool value = false;
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 120,
              width: 30,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                            context.read<SchoolBloc>().logout();
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 400),
                                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                                  return ChooseUserPage();
                                },
                                transitionsBuilder:
                                    (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                                  return Align(
                                    child: SlideTransition(
                                      position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation),
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
  void initState() {
    super.initState();
  }

  var tileBtns = [
    {
      "title": "Profile",
      "icon": FontAwesomeIcons.user,
      "page": AdminProfileBody(),
      "access": [0, 1],
    },
    {
      "title": "Profile",
      "icon": FontAwesomeIcons.user,
      "page": TeacherProfile(),
      "access": [0, 2],
    },
    {
      "title": "Event",
      "icon": FontAwesomeIcons.calendarPlus,
      "page": AdminEventBody(),
      "access": [0, 1, 2],
    },
    {
      "title": "Event",
      "icon": FontAwesomeIcons.calendarPlus,
      "page": TeacherEvent(),
      "access": [0, 1, 2],
    },
    {
      "title": "Student",
      "icon": FontAwesomeIcons.userFriends,
      "page": AdminStudentPage(),
      "access": [0, 1],
    },
    {
      "title": "Attendance",
      "icon": FontAwesomeIcons.calendarCheck,
      "page": TeacherAttendance(),
      "access": [0, 2],
    },
    {
      "title": "Homework",
      "icon": FontAwesomeIcons.bookDead,
      "page": TeacherHomework(),
      "access": [0, 2],
    },
    {
      "title": "Subject",
      "icon": FontAwesomeIcons.bookReader,
      "page": AdminSubjectPage(),
      "access": [0, 1, 2],
    },
    {
      "title": "Payment",
      "icon": FontAwesomeIcons.handshake,
      "page": AdminFeePage(),
      "access": [0, 1, 2, 3],
    },
    {
      "title": "Staff",
      "icon": FontAwesomeIcons.book,
      "page": AdminStaffPage(),
      "access": [0, 1],
    },
    {
      "title": "Exam",
      "icon": FontAwesomeIcons.edit,
      "page": AdminExamPage(),
      "access": [0, 1, 2, 3],
    },
    {
      "title": "Timetable",
      "icon": FontAwesomeIcons.clock,
      "page": AdminTimetablePage(),
      "access": [0, 1, 2],
    },
    {
      "title": "Leave",
      "icon": FontAwesomeIcons.calendarTimes,
      "page": TeacherLeave(),
      "access": [0, 2],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: BlocBuilder<SchoolBloc, UserInformation>(builder: (_, data) {
        return Container(
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
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                        Theme.of(context).accentColor,
                        Theme.of(context).primaryColor,
                      ])),
                      child: Column(
                        children: [
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
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Varela')),
                              Text(
                                "St.Horizon School",
                                style: TextStyle(fontFamily: "Varela", fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
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
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                height: MediaQuery.of(context).size.height / 9,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30,
                    childAspectRatio: 1.2,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    children: tileBtns.where((i) {
                      // int role = int.parse(data.role);
                      int role = 2;
                      List access = i['access'];
                      return access.contains(role);
                    }).map((tile) {
                      return TileButton(
                        icon: tile['icon'],
                        title: tile['title'],
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => tile['page']));
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.only(top: 5, bottom: 10, left: 20, right: 20),
        // color: HexColor('#B9E2DA'),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 7,
                blurRadius: 5,
                offset: Offset(3, 3),
              )
            ]),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                style: TextStyle(color: HexColor("#F7A529"), fontFamily: 'Varela', fontSize: 11),
              )
            ],
          )),
          Container(
              child: Column(
            children: [
              IconButton(icon: Icon(FontAwesomeIcons.userAlt), onPressed: () {}, iconSize: 30, color: HexColor("#F7A529")),
              Text("Profile", style: TextStyle(color: HexColor("#F7A529"), fontFamily: 'Varela', fontSize: 11))
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
                Text(
                  "Logout",
                  style: TextStyle(
                    color: HexColor("#F7A529"),
                    fontFamily: 'Varela',
                    fontSize: 11,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);

    path.quadraticBezierTo(size.width / 6, size.height - 50, size.width / 4, size.height - 20);
    // path.quadraticBezierTo(
    //     size.width / 4, size.height, size.width / 1.5, size.height + 20);
    path.quadraticBezierTo(size.width * 0.25, size.height + 10, size.width * .5, size.height - 30);
    path.lineTo(size.width / 2, size.height - 30);
    path.quadraticBezierTo(size.width - (size.width / 5), size.height, size.width, size.height - 50);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
