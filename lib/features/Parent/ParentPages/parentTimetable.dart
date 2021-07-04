import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ParentTimetable extends StatefulWidget {
  @override
  _ParentTimetableState createState() => _ParentTimetableState();
}

class _ParentTimetableState extends State<ParentTimetable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            padding: EdgeInsets.only(bottom: 40),
                            child: Text("Timetable",
                                style: TextStyle(
                                    fontFamily: "Varela",
                                    fontSize: 22,
                                    color: Colors.black))),
                      ],
                    ),
                  )),
                  
                ],
              ),
            ])));
  }
}
