import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminExamBody extends StatefulWidget {
  @override
  _AdminExamBodyState createState() => _AdminExamBodyState();
}

class _AdminExamBodyState extends State<AdminExamBody>
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
      appBar: AppBar(
        title: Text(
          "Manage Exam",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                  height: 40,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.black,
                    tabs: [
                      Container(
                        child: RichText(
                          text: TextSpan(
                              text: "Create",
                              style: TextStyle(fontSize: 13),
                              children: [
                                TextSpan(
                                    text: " Exam",
                                    )
                              ]),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: RichText(
                          text: TextSpan(
                              text: "Exam",
                              style: TextStyle(fontSize: 13),
                              children: [TextSpan(text: " List")]),
                        ),
                      ),
                    ],
                    controller: _tabController,
                  )),
              Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[CreateExam(), ExamList()]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Create Exam page

class CreateExam extends StatefulWidget {
  @override
  _CreateExamState createState() => _CreateExamState();
}

class _CreateExamState extends State<CreateExam> {
  String chooseValue;
  String chooseStudent;
  List stuList = ["sushila", "Aadesh", "Supiya"];
  List dropList = ["Class 1", "Class 2", "Class 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 50),
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
                  "Date From :",
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
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date To :",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Varela"),
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
          SizedBox(height: 40),
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
        ],
      )),
    );
  }
}

//Exam List

class ExamList extends StatefulWidget {
  @override
  _ExamListState createState() => _ExamListState();
}

class _ExamListState extends State<ExamList> {
  String chooseValue;
  List dropList = ["Class 1", "Class 2", "Class 3"];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.5,
            color: Colors.grey.withOpacity(0.2),
            padding: EdgeInsets.only(left: 20),
            child: DropdownButton(
              isExpanded: true,
              value: chooseValue,
              onChanged: (_newValue) {
                setState(() {
                  chooseValue = _newValue;
                });
              },
              items: dropList.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
              hint: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text("Select Class"),
              ),
              underline: SizedBox(),
            ),
          ),
        ],
      ),
    ));
  }
}
