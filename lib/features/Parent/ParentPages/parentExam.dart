import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ParentExam extends StatefulWidget {
  @override
  _ParentExamState createState() => _ParentExamState();
}

class _ParentExamState extends State<ParentExam> with TickerProviderStateMixin {
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
            child: Stack(
              children: [
                ClipRRect(
                  child: Container(
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
                    height: 200,
                    width: double.infinity,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              color: HexColor("#ffffff"),
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              iconSize: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text("Exam",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontFamily: 'Varela',
                                      fontWeight: FontWeight.w500)),
                            ),
                            IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {},
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                    ]),
                  ),
                ),
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: RichText(
                                      text: TextSpan(
                                          text: "Report ",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black),
                                          children: [TextSpan(text: " Card")]),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: RichText(
                                      text: TextSpan(
                                          text: "Exam",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black),
                                          children: [
                                            TextSpan(text: " Schedule")
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
                              ReportCard(),
                              Container(
                                child: Text(""),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
                // ClipRRect(
                //   child: Padding(
                //       padding: EdgeInsets.only(left: 40, top: 180),
                //       child: Container(
                //         decoration: BoxDecoration(
                //           // boxShadow: [
                //           //   BoxShadow(
                //           //     color: Colors.grey,
                //           //     spreadRadius: 1,
                //           //     blurRadius: 4,
                //           //     offset: Offset(0, 6),
                //           //   )
                //           // ],
                //           borderRadius: BorderRadius.circular(10),
                //           // border: Border.all(color: HexColor("#B9E2DA")),
                //           color: Colors.white,
                //         ),
                //         height: 45,
                //         width: MediaQuery.of(context).size.width * 0.8,
                //         child: Container(
                //           padding: EdgeInsets.only(left: 20),
                //           child: DropdownButton(
                //             isExpanded: true,
                //             value: chooseValue,
                //             onChanged: (_newValue) {
                //               setState(() {
                //                 chooseValue = _newValue;
                //               });
                //             },
                //             items: dropList.map((valueItem) {
                //               return DropdownMenuItem(
                //                 value: valueItem,
                //                 child: Text(valueItem),
                //               );
                //             }).toList(),
                //             hint: Padding(
                //               padding: EdgeInsets.only(left: 8.0),
                //               child: Text("Select Class"),
                //             ),
                //             icon: Icon(Icons.arrow_drop_down),
                //             iconSize: 40,
                //             underline: SizedBox(),
                //             iconEnabledColor: HexColor("#F7A529"),
                //           ),
                //         ),
                //       )),
                // ),
                // SizedBox(height: 40)
                // // Padding(
                // //   padding: EdgeInsets.only(top: 200.0),
                // //   child: Container(
                // //     //  height: 500,
                // //     width: MediaQuery.of(context).size.width,
                // //     decoration: BoxDecoration(
                // //         color: Colors.white,
                // //         // borderRadius: BorderRadius.only(
                // //         //     topLeft: Radius.circular(30),
                // //         //     topRight: Radius.circular(30))
                // //             ),
                // //     child: Column(
                // //       children: [

                // //         Text(""),

                // //       ],
                // //     ),
                // //   ),
                // // )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class ReportCard extends StatefulWidget {
  @override
  _ReportCardState createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  String chooseValue;

  List dropList = ["March 21", "Class test", "Dec 21"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
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
                // border: Border.all(color: HexColor("#B9E2DA")),
                color: Colors.grey.withOpacity(0.1)),
            height: MediaQuery.of(context).size.height * 0.16,
            width: double.infinity,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3))
                          ],
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.6)),
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              image: AssetImage("assets/images/profile.jpg"),
                              fit: BoxFit.cover))),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Column(children: [
                      Text("Jame Doe",
                          style: TextStyle(
                              color: HexColor("#F7A529"),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Varela")),
                      Text("Class 1-A",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "Varela")),
                      Text("Jame Doe",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "Varela"))
                    ]),
                  )
                ],
              ),
            )),
      ),
      SizedBox(height: 40),
      Container(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: RichText(
            text: TextSpan(
                text: "Note: ",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Varela",
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      text:
                          " If Exam Name List is empty, that means result of no exam is ready to display")
                ]),
          )),
      SizedBox(height: 40),
      Container(
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
          border: Border.all(color: HexColor("#F7A529")),
          color: Colors.white,
        ),
        height: 45,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Container(
          padding: EdgeInsets.only(left: 10),
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
                "Select Exam",
                style: TextStyle(fontSize: 13, fontFamily: "Varela", color: Colors.grey.withOpacity(0.5)),
              ),
            ),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 40,
            underline: SizedBox(),
            iconEnabledColor: HexColor("#B9E2DA"),
          ),
        ),
      ),
    ])));
  }
}
