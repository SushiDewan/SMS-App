import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TeacherExam extends StatefulWidget {
  @override
  _TeacherExamState createState() => _TeacherExamState();
}

class _TeacherExamState extends State<TeacherExam> {
  String chooseStudent;
  List stuList = ["sushila", "Aadesh", "Supiya"];
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
                          child: Text("Exam",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Varela',
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Exam Type:",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Varela",
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        // color: Colors.black,
                      ),
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Container(
                        child: DropdownButton(
                          isExpanded: true,
                          value: chooseStudent,
                          onChanged: (_newValue) {
                            setState(() {
                              chooseStudent = _newValue;
                            });
                          },
                          items: stuList.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                          underline: SizedBox(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Class:",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Varela",
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        // color: Colors.black,
                      ),
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Container(
                        child: DropdownButton(
                          isExpanded: true,
                          value: chooseStudent,
                          onChanged: (_newValue) {
                            setState(() {
                              chooseStudent = _newValue;
                            });
                          },
                          items: stuList.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                          underline: SizedBox(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                  child: Scrollbar(
                      child: ListView(children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Table(
                      columnWidths: {
                        0: FixedColumnWidth(60.0),
                        1: FixedColumnWidth(150),
                        2: FixedColumnWidth(150.0),
                        3: FixedColumnWidth(150.0),
                        4: FixedColumnWidth(150.0),
                        5: FixedColumnWidth(150.0),
                      },
                      border: TableBorder(
                          horizontalInside: BorderSide(
                              width: 1, color: Colors.grey.withOpacity(0.3))),
                      children: [
                        TableRow(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1)),
                            children: [
                              TableCell(
                                  child: SizedBox(
                                height: 40,
                                child: Center(
                                  child: Text('SN',
                                      style: TextStyle(fontSize: 15.0, fontFamily: "Varela")),
                                ),
                              )),
                              TableCell(
                                  child: SizedBox(
                                      height: 40,
                                      child: Center(
                                        child: Text('Name',
                                            style: TextStyle(fontSize: 15.0,fontFamily: "Varela")),
                                      ))),
                              TableCell(
                                  child: SizedBox(
                                height: 40,
                                child: Center(
                                  child: Text('Full Mark',
                                      style: TextStyle(fontSize: 15.0, fontFamily: "Varela")),
                                ),
                              )),
                              TableCell(
                                  child: SizedBox(
                                height: 40,
                                child: Center(
                                  child: Text('Pass Mark',
                                      style: TextStyle(fontSize: 15.0, fontFamily: "Varela")),
                                ),
                              )),
                              TableCell(
                                  child: SizedBox(
                                height: 40,
                                child: Center(
                                  child: Text('Obtained Mark',
                                      style: TextStyle(fontSize: 15.0, fontFamily: "Varela")),
                                ),
                              )),
                              TableCell(
                                  child: SizedBox(
                                      height: 40,
                                      child: Center(
                                        child: Text('Grade',
                                            style: TextStyle(fontSize: 15.0, fontFamily: "Varela")),
                                      ))),
                            ]),
                        TableRow(children: [
                          Column(children: [Text('')]),
                          Column(children: [Text('')]),
                          Column(children: [Text('')]),
                          Column(children: [
                            Text('', style: TextStyle(fontSize: 20.0))
                          ]),
                          Column(children: [
                            Text('', style: TextStyle(fontSize: 20.0))
                          ]),
                          Column(children: [
                            Text('', style: TextStyle(fontSize: 20.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [Text('')]),
                          Column(children: [Text('')]),
                          Column(children: [Text('')]),
                          Column(children: [
                            Text('', style: TextStyle(fontSize: 20.0))
                          ]),
                          Column(children: [
                            Text('', style: TextStyle(fontSize: 20.0))
                          ]),
                          Column(children: [
                            Text('', style: TextStyle(fontSize: 20.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [Text('')]),
                          Column(children: [Text('')]),
                          Column(children: [Text('')]),
                          Column(children: [
                            Text('', style: TextStyle(fontSize: 20.0))
                          ]),
                          Column(children: [
                            Text('', style: TextStyle(fontSize: 20.0))
                          ]),
                          Column(children: [
                            Text('', style: TextStyle(fontSize: 20.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [Text('')]),
                          Column(children: [Text('')]),
                          Column(children: [Text('')]),
                          Column(children: [
                            Text('', style: TextStyle(fontSize: 20.0))
                          ]),
                          Column(children: [
                            Text('', style: TextStyle(fontSize: 20.0))
                          ]),
                          Column(children: [
                            Text('', style: TextStyle(fontSize: 20.0))
                          ]),
                        ]),
                      ],
                    ),
                  ),
                ),
              ]))),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                width: 180,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: HexColor("#F7A529"),
                    onPressed: () {},
                    child: Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Varela",
                          fontWeight: FontWeight.w600),
                    )),
              )
            ])));
  }
}
