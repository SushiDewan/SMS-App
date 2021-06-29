import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class TeacherProfileBody extends StatefulWidget {
  @override
  _TeacherProfileBodyState createState() => _TeacherProfileBodyState();
}

class _TeacherProfileBodyState extends State<TeacherProfileBody>{
  
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
                                      Text("Teacher",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontFamily: "Varela")),
                                      Text("ID No: 0238",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontFamily: "Varela"))
                                    ]),
                                  )
                                ],
                              )),
                        )),
                  ),
                ],
              ),
              
            ])));
  }
}
