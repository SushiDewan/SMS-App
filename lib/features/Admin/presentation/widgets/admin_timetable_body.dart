import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminTimetableBody extends StatefulWidget {
  @override
  _AdminTimetableBodyState createState() => _AdminTimetableBodyState();
}

class _AdminTimetableBodyState extends State<AdminTimetableBody>
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
                                    text: "Timetable",
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
                length: 2,
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
                                        text: "Create",
                                        style: TextStyle(fontSize: 13),
                                        children: [
                                          TextSpan(text: " Timetable")
                                        ]),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RichText(
                                    text: TextSpan(
                                        text: "View",
                                        style: TextStyle(fontSize: 13),
                                        children: [
                                          TextSpan(text: " Timetable")
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
                            CreateTimetable(),
                            ViewTimetable(),
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

class CreateTimetable extends StatefulWidget {
  @override
  _CreateTimetableState createState() => _CreateTimetableState();
}

class _CreateTimetableState extends State<CreateTimetable> {
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
            padding: EdgeInsets.only(top: 20.0, left:30, right:30),
            child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                      "Select Class :",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Varela'),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Colors.grey),
                      // color: Colors.black,
                    ),
                    height: 40,
                    width: 145,
                    child: Container(
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
                        // hint: Padding(
                        //   padding: EdgeInsets.only(left: 8.0),
                        //   child: Text("Select Class"),
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
            padding: EdgeInsets.only(left:30, right:30),
            child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                      "Select Subject :",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Varela'),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Colors.grey),
                      // color: Colors.black,
                    ),
                    height: 40,
                    width: 145,
                    child: Container(
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
                        // hint: Padding(
                        //   padding: EdgeInsets.only(left: 8.0),
                        //   child: Text("Select Class"),
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
            padding: const EdgeInsets.only(left:30.0, right: 30),
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
            padding: const EdgeInsets.only(left:30.0, right: 30),
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
              elevation: 5,
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

class ViewTimetable extends StatefulWidget {
  @override
  _ViewTimetableState createState() => _ViewTimetableState();
}

class _ViewTimetableState extends State<ViewTimetable> {
  String chooseValue;

  List dropList = ["Class 1", "Class 2", "Class 3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
            padding: EdgeInsets.only(left: 40, top: 20),
            child: Container(
              decoration: BoxDecoration(
                //                     boxShadow: [
                //                        BoxShadow(
                //                             color: Colors.grey.withOpacity(0.5),
                // spreadRadius: 5,
                // blurRadius: 7,
                // offset: Offset(0, 3),)
                //                     ],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: HexColor("#C34332").withOpacity(0.2)),
                color: Colors.white,
              ),
              height: 45,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Container(
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
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 40,
                  underline: SizedBox(),
                  iconEnabledColor: HexColor("#FF8A00"),
                ),
              ),
            )),
      ),
    );
  }
}
