import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smsapp/BLoc/UserInformation.dart';
import 'package:smsapp/CustomWidget/Profile.dart';
import 'package:smsapp/CustomWidget/TileButton.dart';
import 'package:smsapp/features/Admin/admin_event_body.dart';
import 'package:smsapp/features/Admin/admin_exam_body.dart';
import 'package:smsapp/features/Admin/admin_fee_body.dart';
import 'package:smsapp/features/Admin/approve_user.dart';
import 'package:smsapp/features/Admin/profile_body.dart';
import 'package:smsapp/features/Admin/admin_staff_body.dart';
import 'package:smsapp/features/Admin/admin_student_body.dart';
import 'package:smsapp/features/Admin/admin_subject_body.dart';
import 'package:smsapp/features/Admin/admin_timetable_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smsapp/features/Login/loginPage.dart';
import 'package:smsapp/features/Teacher/TeacherPages/teacherAttendance.dart';
import 'package:smsapp/features/Admin/eventBody.dart';
import 'package:smsapp/features/Teacher/TeacherPages/teacherHomework.dart';
import 'package:smsapp/features/Teacher/TeacherPages/teacherLeave.dart';

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
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    "Do you really want to Log out?",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Varela"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        child: Text("Yes"),
                        onPressed: () {
                          context.read<SchoolBloc>().logout();
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
                        ),
                      ),
                      TextButton(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          primary: Colors.white,
                        ),
                      )
                    ],
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
      "page": ProfileBody(),
      "access": [0, 1],
    },
    {
      "title": "Event",
      "icon": FontAwesomeIcons.calendarPlus,
      "page": AdminEventBody(),
      "access": [0, 1],
    },
    {
      "title": "Event",
      "icon": FontAwesomeIcons.calendarPlus,
      "page": TeacherEvent(),
      "access": [0, 2],
    },
    {
      "title": "Student",
      "icon": FontAwesomeIcons.userFriends,
      "page": AdminStudentBody(),
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
      "title": "Approve User",
      "icon": FontAwesomeIcons.userCheck,
      "page": ApproveUser(),
      "access": [0, 1],
    },
    {
      "title": "Subject",
      "icon": FontAwesomeIcons.bookReader,
      "page": AdminSubjectBody(),
      "access": [0, 1, 2],
    },
    {
      "title": "Payment",
      "icon": FontAwesomeIcons.handshake,
      "page": AdminFeeBody(),
      "access": [0, 1, 2, 3],
    },
    {
      "title": "Staff",
      "icon": FontAwesomeIcons.book,
      "page": AdminStaffBody(),
      "access": [0, 1],
    },
    {
      "title": "Exam",
      "icon": FontAwesomeIcons.edit,
      "page": AdminExamBody(),
      "access": [0, 1, 2, 3],
    },
    {
      "title": "Timetable",
      "icon": FontAwesomeIcons.clock,
      "page": AdminTimetableBody(),
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<SchoolBloc, UserInformation>(builder: (_, data) {
        return Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      // bottomLeft: Radius.circular(30),
                      // bottomRight: Radius.circular(30),
                      ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "DashBoard",
                              style: TextStyle(
                                letterSpacing: 0.9,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            splashColor: Colors.white,
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_none_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Profile(),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  children: tileBtns.where((i) {
                    // int role = int.parse(data.role);
                    int role = 1;
                    List access = i['access'];
                    return access.contains(role);
                  }).map((tile) {
                    return TileButton(
                      icon: tile['icon'],
                      title: tile['title'],
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tile['page']));
                      },
                    );
                  }).toList(),
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
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                    iconSize: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    "Notification",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileBody()));
                      },
                      iconSize: 30,
                      color: Theme.of(context).primaryColor),
                  Text("Profile",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
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
                        color: Theme.of(context).primaryColor),
                    Text(
                      "Logout",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
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
