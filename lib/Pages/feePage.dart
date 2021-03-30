import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FeePage extends StatefulWidget {
  @override
  _FeePageState createState() => _FeePageState();
}

class _FeePageState extends State<FeePage> with TickerProviderStateMixin {
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
                              color: HexColor("#ffffff"),
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
                                    text: "Fee",
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
                              tabs: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Fee",
                                        style: TextStyle(fontSize: 13),
                                        children: [
                                          TextSpan(text: " Structure")
                                        ]),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Fee",
                                        style: TextStyle(fontSize: 13),
                                        children: [TextSpan(text: " History")]),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: RichText(
                                      text: TextSpan(
                                          text: "Fee",
                                          style: TextStyle(fontSize: 13),
                                          children: [
                                            TextSpan(text: " Remainder")
                                          ]),
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
                            FeeStructure(),
                            Container(
                              child: Text(""),
                            ),
                            Container(
                              child: Text(""),
                            ),
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

class FeeStructure extends StatefulWidget {
  @override
  _FeeStructureState createState() => _FeeStructureState();
}

class _FeeStructureState extends State<FeeStructure> {
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
                        Border.all(color: Colors.grey),
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
                        Border.all(color: Colors.grey),
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
            padding: const EdgeInsets.only(left:30.0, right: 30),
            child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fee Type :",
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
                  "Enter Amount :",
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
