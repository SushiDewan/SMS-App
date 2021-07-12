import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminStudentBody extends StatefulWidget {
  @override
  _AdminStudentBodyState createState() => _AdminStudentBodyState();
}

class _AdminStudentBodyState extends State<AdminStudentBody>
    with TickerProviderStateMixin {
  String chooseValue;
  List dropList = ["Class 1", "Class 2", "Class 3"];
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Manage Student",
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 0.9,
                fontFamily: "Varela",
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          elevation: 0,
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white),
            tabs: [
              Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    "Add Student".toUpperCase(),
                    style: TextStyle(
                        fontFamily: "Varela",
                        letterSpacing: 0.9,
                        fontWeight: FontWeight.w600),
                  )),
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  "Student List".toUpperCase(),
                  style: TextStyle(
                      fontFamily: "Varela",
                      letterSpacing: 0.9,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
            controller: _tabController,
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
            controller: _tabController,
            children: <Widget>[AddStudent(), StudentList()]),
      ),
    );
  }
}

//Add Student page

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 30),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
                // color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 5))
                ]),
            child: Padding(
              padding: EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Column(children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "STUDENT ADD",
                    style: TextStyle(
                        color: HexColor("#F7A529"),
                        fontFamily: "Varela",
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Name:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Email:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Birth Day:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Address 1:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Address 2:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "City:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "State:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Country:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Phone:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Salary Type:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Salary:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Password:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Confirm Psw:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Varela",
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                                  // color: Colors.black,
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue))),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      MaterialButton(
                          elevation: 5,
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: HexColor("#F7A529"),
                          onPressed: () {},
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Varela",
                                  fontSize: 15),
                            ),
                          ))
                    ]),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    ));
  }
}

//Student List Page

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  String chooseValue;

  List dropList = ["Class 1", "Class 2", "Class 3"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Theme.of(context).accentColor),
                // color: Colors.black,
              ),
              height: 45,
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
                  child: Text(
                    "Select Class",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 40,
                underline: SizedBox(),
                iconEnabledColor: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
