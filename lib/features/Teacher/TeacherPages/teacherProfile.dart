import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class TeacherProfile extends StatefulWidget {
  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Material(
            child: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                  color: Theme.of(context).primaryColor,
                ),
                height: 200,
                width: double.infinity,
              ),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              elevation: 0,
              title: Text("Profile", style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: "Varela", fontWeight: FontWeight.w600)),
            ),
            backgroundColor: Colors.transparent,
            body: Container(
                padding: EdgeInsets.only(left: 40, top: 20),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height * 0.16,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.6), spreadRadius: 2, blurRadius: 4, offset: Offset(0, 3))],
                                    border: Border.all(color: Colors.grey.withOpacity(0.6)),
                                    borderRadius: BorderRadius.circular(40),
                                    image: DecorationImage(image: AssetImage("assets/images/profile.jpg"), fit: BoxFit.cover))),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Column(children: [
                                Text("Jame Doe",
                                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: "Varela")),
                                Text("Teacher", style: TextStyle(color: Colors.black, fontSize: 13, fontFamily: "Varela")),
                                Text("ID No: 0238", style: TextStyle(color: Colors.black, fontSize: 13, fontFamily: "Varela"))
                              ]),
                            )
                          ],
                        )),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
