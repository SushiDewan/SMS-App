import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminStaffBody extends StatefulWidget {
  @override
  _AdminStaffBodyState createState() => _AdminStaffBodyState();
}

class _AdminStaffBodyState extends State<AdminStaffBody> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
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
      child: Column(
        children: [
          Expanded(
            child: Stack(children: [
              ClipRRect(
                child: Container(
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: HexColor("#B9E2DA")
                      // gradient: LinearGradient(
                      //     begin: Alignment.topLeft,
                      //     end: Alignment.bottomRight,
                      //     colors: [
                      //       HexColor("#FF8A00").withOpacity(0.8),
                      //       HexColor("#FF8A00")
                      //     ])
                      ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: IconButton(
                              color: Colors.black,
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              iconSize: 30,
                            ),
                          ),
                          // Container(
                          //     padding: EdgeInsets.only(left: 280, top: 30),
                          //     child: IconButton(
                          //       icon: Icon(Icons.menu),
                          //       onPressed: () {},
                          //       color: Colors.white,
                          //     ))
                        ],
                      ),
                      Container(
                        // padding: EdgeInsets.only(left: 0),
                        child: RichText(
                          text: TextSpan(
                              text: "Manage",
                              style: TextStyle(
                                  color: HexColor("#F7A529"),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23,
                                  fontFamily: "Varela"),
                              children: [
                                TextSpan(
                                    text: "Subject",
                                    style: TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w200,
                                        color: HexColor("#F7A529")))
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    ClipRRect(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 190.0),
                        child: Container(
                            height: 40,
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorColor: Colors.black,
                              tabs: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Add",
                                        style: TextStyle(fontSize: 13),
                                        children: [TextSpan(text: " Staff")]),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Assign",
                                        style: TextStyle(fontSize: 13),
                                        children: [TextSpan(text: " Staff")]),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: RichText(
                                      text: TextSpan(
                                          text: "Staff",
                                          style: TextStyle(fontSize: 13),
                                          children: [TextSpan(text: " List")]),
                                    ),
                                  ),
                                )
                              ],
                              controller: _tabController,
                            )),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            AddStaff(),
                            AssignStaff(),
                            Container(
                              child: Text(""),
                            )
                          ]),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}

//Add Staff page

class AddStaff extends StatefulWidget {
  @override
  _AddStaffState createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    "STAFF ADD",
                    style: TextStyle(
                        color: HexColor("#F7A529"),
                        fontFamily: "Varela",
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 20),
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
    );
  }
}

//Assign Staff

class AssignStaff extends StatefulWidget {
  @override
  _AssignStaffState createState() => _AssignStaffState();
}

class _AssignStaffState extends State<AssignStaff> {
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
                    border:
                        Border.all(color: HexColor("#C34332").withOpacity(0.2)),
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
                  "Select Subject:",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Varela",
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: HexColor("#C34332").withOpacity(0.2)),
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
                  "Select Staff:",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Varela",
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: HexColor("#C34332").withOpacity(0.2)),
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
