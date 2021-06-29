import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TeacherEventBody extends StatefulWidget {
  @override
  _TeacherEventBodyState createState() => _TeacherEventBodyState();
}

class _TeacherEventBodyState extends State<TeacherEventBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Expanded(
              child: Stack(
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
                            color: HexColor("#ffffff"),
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 60),
                          child: Text("Events",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Varela',
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  )),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: ClipRRect(
                          child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // color: HexColor("#E6FEE8"),
                          // borderRadius: BorderRadius.only(
                          //     topLeft: Radius.circular(30),
                          //     topRight: Radius.circular(30))
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 60.0, left: 30, right: 30, bottom: 20),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor("#F7A529"),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          color: HexColor("#F7A529"),
                                          offset: Offset(0, 5))
                                    ]),
                                child: ListTile(
                                    title: Text(
                                      "First Event",
                                      style: TextStyle(
                                          fontFamily: "Varela",
                                          fontSize: 18,
                                          color: HexColor("#006658"),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: Text(
                                      "Tommorrow will be holiday",
                                      style: TextStyle(
                                        fontFamily: "Rubik",
                                      ),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0, left: 30, right: 30),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor("#FFCC00"),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          color: HexColor("#FFCC00"),
                                          offset: Offset(0, 5))
                                    ]),
                                child: ListTile(
                                    title: Text("first Event"),
                                    subtitle:
                                        Text("Tommorrow will be holiday")),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
