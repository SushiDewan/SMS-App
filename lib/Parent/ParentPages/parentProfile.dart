import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class ParentProfile extends StatefulWidget {
  @override
  _ParentProfileState createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile>
    with TickerProviderStateMixin {
  TabController _tabbarController;
  @override
  void initState() {
    super.initState();
    _tabbarController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabbarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: double.infinity,
            child: Column(children: [
              Stack(
                children: <Widget>[
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
                            padding: EdgeInsets.only(left: 110, bottom: 20),
                            child: Text("Profile",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: HexColor("#F7A529"),
                                    fontFamily: "Varela",
                                    fontWeight: FontWeight.w600))),
                      ],
                    ),
                  )),
                  ClipRRect(
                    child: Padding(
                        padding: EdgeInsets.only(left: 40, top: 160),
                        child: Container(
                          decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey,
                            //     spreadRadius: 1,
                            //     blurRadius: 4,
                            //     offset: Offset(0, 6),
                            //   )
                            // ],
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: HexColor("#B9E2DA")),
                            color: Colors.white,
                          ),
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.6),
                                                spreadRadius: 2,
                                                blurRadius: 4,
                                                offset: Offset(0, 3))
                                          ],
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.6)),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/profile.jpg"),
                                              fit: BoxFit.cover))),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18.0),
                                    child: Column(children: [
                                      Text("Jame Doe",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Varela")),
                                      Text("Class 1-A",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: "Varela")),
                                      Text("Jame Doe",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: "Varela"))
                                    ]),
                                  )
                                ],
                              )),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  // color: Colors.black,
                  height: 40,
                  child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                      unselectedLabelColor: Colors.black.withOpacity(0.2),
                      indicatorColor: HexColor("#B9E2DA"),
                      tabs: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text("PERSONAL",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Varela",
                                    fontSize: 13))),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text("PARENTS",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Varela",
                                    fontSize: 13))),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("OTHERS",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Varela",
                                      fontSize: 13))),
                        )
                      ],
                      controller: _tabbarController,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                    controller: _tabbarController,
                    children: <Widget>[
                      Container(
                        child: Personal(),
                      ),
                      Container(
                        child: Parent(),
                      ),
                      Container(child: Others()),
                    ]),
              )
            ])));
  }
}

class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(""),
    );
  }
}

class Parent extends StatefulWidget {
  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Column(
                            children: [
                              Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.6),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                            offset: Offset(0, 3))
                                      ],
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.6)),
                                      borderRadius: BorderRadius.circular(40),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/profile.jpg"),
                                          fit: BoxFit.cover))),
                              SizedBox(height: 15),
                              Text(
                                "Father",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Varela"),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:58.0, top: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.user),
                                  Padding(
                                    padding: const EdgeInsets.only(left:17.0),
                                    child: Text("John Doe",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Varela")),
                                  )
                                ],
                              ),
                               SizedBox(height:8),
                               Row(
                            children: [
                              Icon(FontAwesomeIcons.phone),
                              Padding(
                                padding: const EdgeInsets.only(left:18.0),
                                child: Text("98374837",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Varela")),
                              )
                            ],
                          ),
                          SizedBox(height:8),
                           Row(
                            children: [
                              Icon(FontAwesomeIcons.book),
                              Padding(
                                padding: const EdgeInsets.only(left:10.0),
                                child: Text("Doctor",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Varela")),
                              )
                            ],
                          )
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  )
                ]),
              ),
            ])));
  }
}

class Others extends StatefulWidget {
  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("hello"),
    );
  }
}
