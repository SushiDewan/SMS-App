import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StudentHomework extends StatefulWidget {
  @override
  _StudentHomeworkState createState() => _StudentHomeworkState();
}

class _StudentHomeworkState extends State<StudentHomework> {
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
                            color: Colors.white,
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 30,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 40),
                            child: Text("Homework",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black))),
                      ],
                    ),
                  )),
                  ClipRRect(
                    child: Padding(
                        padding: EdgeInsets.only(left: 40, top: 170),
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
                            // border: Border.all(color: Hexcolor("#B9E2DA")),
                            color: Colors.white,
                          ),
                          height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: TextButton(
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2025),
                                    );
                                  },
                                  child: Text("Select Date"))),
                        )),
                  ),
                ],
              ),
            ])));
  }
}
