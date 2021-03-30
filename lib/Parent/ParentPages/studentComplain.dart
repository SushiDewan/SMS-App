import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StudentComplaint extends StatefulWidget {
  @override
  _StudentComplaintState createState() => _StudentComplaintState();
}

class _StudentComplaintState extends State<StudentComplaint>
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
                            child: Text("Complaint",
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
                                            text: "Complaint by",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(text: " Teacher")
                                            ]),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: RichText(
                                        text: TextSpan(
                                            text: "Complaint by",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(text: " Parent/Student")
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
                                Container(
                                  child: Text(""),
                                ),
                                Container(
                                  child: parentComplaint(),
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

Widget parentComplaint() {
  return Container(
    padding: EdgeInsets.only(top:30),
    child: Column(
      children: [
        Container(
          width: 300,
          child: MaterialButton(
            height: 50,
            
            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
            elevation: 20,
            color: HexColor("#F7A529"),
            onPressed: () {}, child: Text("Make a Complaint")),
        ),
      ],
    ),
  );
}
