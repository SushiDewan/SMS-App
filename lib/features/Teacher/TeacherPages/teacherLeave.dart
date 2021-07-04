

import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

class TeacherLeave extends StatefulWidget {
  @override
  _TeacherLeaveState createState() => _TeacherLeaveState();
}

class _TeacherLeaveState extends State<TeacherLeave>
    with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            child: Column(children: [
              Expanded(
                child: Stack(children: <Widget>[
                  ClipRRect(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: HexColor("#B9E2DA")),
                    height: 200,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 50.0),
                          child: IconButton(
                            color: Colors.black,
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 30,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 40),
                            child: Text("Leave Page",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black))),
                      ],
                    ),
                  )),
                  // ]),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left:10.0, right: 10),
                  //       child: Container(
                  //         // color: Colors.black,
                  //         height: 40,
                  //         child: DefaultTabController(
                  //           length: 3,
                  //           child: TabBar(
                  //             unselectedLabelColor: Colors.black.withOpacity(0.2),
                  //             indicatorColor: HexColor("#B9E2DA"),
                  //                 tabs: [
                  //                   Container(
                  //                     width: MediaQuery.of(context).size.width * 0.3,
                  //                     child: Text("PERSONAL", style:TextStyle(color: Colors.black))
                  //                   ),
                  //                   Container(
                  //                     width: MediaQuery.of(context).size.width * 0.3,
                  //                     child: Text("PARENTS", style:TextStyle(color: Colors.black))
                  //                   ),
                  //                   Container(
                  //                     width: MediaQuery.of(context).size.width * 0.3,
                  //                     child: Padding(
                  //                       padding: EdgeInsets.only(left: 8.0),
                  //                       child: Text("OTHERS", style:TextStyle(color: Colors.black))
                  //                     ),
                  //                   )
                  //                 ],
                  //                 controller: _tabController,
                  //               ), ),

                  //         ),
                  //     ),
                  //       Expanded(
                  //             child: TabBarView(
                  //                 controller: _tabController,
                  //                 children: <Widget>[
                  //                   Container(
                  //                     child: Text("h"),
                  //                   ),
                  //                   Container(
                  //                     child: Text("e"),
                  //                   ),
                  //                   Container(
                  //                     child: Text("l"),
                  //                   )
                  //                 ]),
                  //           )
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        ClipRRect(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 160.0),
                            child: Container(
                                height: 40,
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: TabBar(
                                  tabs: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: RichText(
                                        text: TextSpan(
                                            text: "Create",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(text: " Leave")
                                            ]),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: RichText(
                                        text: TextSpan(
                                            text: "Leave",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(text: " History")
                                            ]),
                                      ),
                                    ),
                                  ],
                                  controller: _tabController,
                                )),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                              controller: _tabController,
                              children: <Widget>[
                                CreateLeave(),
                                LeaveHistory()
                              ]),
                        )
                      ],
                    ),
                  ),
                ]),
              )
            ])));
  }
}

class LeaveHistory extends StatefulWidget {
  @override
  _LeaveHistoryState createState() => _LeaveHistoryState();
}

class _LeaveHistoryState extends State<LeaveHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 100,
                width: 150,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 400),
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return YourLeave();
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
                    child: Text("Your Leave"))),
            Container(
                height: 100,
                width: 150,
                child: ElevatedButton(
                    onPressed: () {}, child: Text("Student leave")))
          ],
        ),
      ),
    );
  }
}

class YourLeave extends StatefulWidget {
  @override
  _YourLeaveState createState() => _YourLeaveState();
}

class _YourLeaveState extends State<YourLeave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: HexColor("#B9E2DA")
                      // gradient: LinearGradient(
                      //     begin: Alignment.topCenter,
                      //     end: Alignment.bottomRight,
                      //     colors: [
                      //   HexColor("#F7A529"), HexColor("#FFCC00")
                      // ])
                      ),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 70.0),
                        child: IconButton(
                          color: Colors.black,
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 60),
                        child: Text("Your Leave",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'Varela',
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                )),
              ],
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: HexColor("#B9E2DA")),
                color: Colors.grey.withOpacity(0.1),
              ),
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Column(children: [
                          Text("Sick Leave",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Varela")),
                          Text("One day Leave",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "Varela")),
                          Text("Dec1-Dec2",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "Varela"))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, top: 50),
                        child: Text(
                          "Approved",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  )),
            )
          ])),
    );
  }
}

class CreateLeave extends StatefulWidget {
  @override
  _CreateLeaveState createState() => _CreateLeaveState();
}

class _CreateLeaveState extends State<CreateLeave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40),
                  child: Column(children: [
                    Text("Application", style: TextStyle(fontFamily: "Varela", fontSize: 22, fontWeight: FontWeight.bold),),
                    SizedBox(height:10),
                    Material(
                        elevation: 5,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                            padding: EdgeInsets.only(left: 40, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  // labelText: "Username",

                                  border: InputBorder.none,
                                  hintText: "name",
                                  hintStyle: TextStyle(
                                      color: Color(0xFFE1E1E1), fontSize: 14)),
                            ))),
                    SizedBox(height: 30),
                    Material(
                        elevation: 5,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                            padding: EdgeInsets.only(left: 40, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Class",
                                  hintStyle: TextStyle(
                                      color: Color(0xFFE1E1E1), fontSize: 14)),
                            ))),
                    SizedBox(height: 30),
                    Material(
                        elevation: 5,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                            padding: EdgeInsets.only(left: 40, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  // labelText: "Username",

                                  border: InputBorder.none,
                                  hintText: "Roll No",
                                  hintStyle: TextStyle(
                                      color: Color(0xFFE1E1E1), fontSize: 14)),
                            ))),
                    SizedBox(height: 30),
                    Material(
                        elevation: 5,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                            padding: EdgeInsets.only(left: 40, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Leave reason",
                                  hintStyle: TextStyle(
                                      color: Color(0xFFE1E1E1), fontSize: 14)),
                            ))),
                    SizedBox(height: 30),
                    Material(
                        elevation: 5,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                            padding: EdgeInsets.only(left: 40, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Leave from Date",
                                  hintStyle: TextStyle(
                                      color: Color(0xFFE1E1E1), fontSize: 14)),
                            ))),
                    SizedBox(height: 30),
                    Material(
                        elevation: 5,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                            padding: EdgeInsets.only(left: 40, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  // labelText: "Username",

                                  border: InputBorder.none,
                                  hintText: "Leave to date",
                                  hintStyle: TextStyle(
                                      color: Color(0xFFE1E1E1), fontSize: 14)),
                            ))),
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: MaterialButton(
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             RegisterVeriCode()));
                          },
                          color: HexColor('#B9E2DA'),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Submit Application",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Varela",
                                      fontWeight: FontWeight.w600),
                                ),
                              ])),
                    ),
                  ]),
                ))));
  }
}
