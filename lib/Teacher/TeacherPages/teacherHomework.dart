import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TeacherHomework extends StatefulWidget {
  @override
  _TeacherHomeworkState createState() => _TeacherHomeworkState();
}

class _TeacherHomeworkState extends State<TeacherHomework>
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
                            child: Text("Assignment",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black))),
                      ],
                    ),
                  )),
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
                                              TextSpan(text: " Assignment")
                                            ]),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: RichText(
                                        text: TextSpan(
                                            text: "Assignment",
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
                                CreateAssignment(),
                                Container(
                                  child: Text(""),
                                ),
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

//Create Assignment Page

class CreateAssignment extends StatefulWidget {
  @override
  _CreateAssignmentState createState() => _CreateAssignmentState();
}

class _CreateAssignmentState extends State<CreateAssignment> {
  String chooseValue;
  String chooseStudent;
  List stuList = ["sushila", "Aadesh", "Supiya"];
  List dropList = ["Class 1", "Class 2", "Class 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 40),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, right: 30, top: 40),
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
                          width: 145,
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
                              // hint: Padding(
                              //   padding: EdgeInsets.only(left: 8.0),
                              //   child: Text("Select Student"),
                              // ),
                              // icon: Icon(Icons.arrow_drop_down),
                              // iconSize: 40,
                              underline: SizedBox(),
                              // iconEnabledColor: HexColor("#FF8A00"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Assignment Type:",
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
                          width: 145,
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
                              // hint: Padding(
                              //   padding: EdgeInsets.only(left: 8.0),
                              //   child: Text("Select Student"),
                              // ),
                              // icon: Icon(Icons.arrow_drop_down),
                              // iconSize: 40,
                              underline: SizedBox(),
                              // iconEnabledColor: HexColor("#FF8A00"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Submit Date :",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Varela'),
                        ),
                        Container(
                          width: 145,
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Work Detail:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Varela'),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left:10, right: 10),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Upload ",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Varela'),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.upload_file,
                              size: 30,
                            ),
                            onPressed: () {})
                      ],
                    )),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Container(
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
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
