import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

class AdminSubjectBody extends StatefulWidget {
  @override
  _AdminSubjectBodyState createState() => _AdminSubjectBodyState();
}

class _AdminSubjectBodyState extends State<AdminSubjectBody>
    with TickerProviderStateMixin {
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
                          //       color: Colors.black,
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
                              indicatorColor: Colors.black,
                              tabs: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Create",
                                        style: TextStyle(fontSize: 13),
                                        children: [TextSpan(text: " Subject")]),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Assign",
                                        style: TextStyle(fontSize: 13),
                                        children: [TextSpan(text: " Subject")]),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: RichText(
                                      text: TextSpan(
                                          text: "Subject",
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
                            CreateSubject(),
                            AssignSubject(),
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

class CreateSubject extends StatefulWidget {
  @override
  _CreateSubjectState createState() => _CreateSubjectState();
}

class _CreateSubjectState extends State<CreateSubject> {
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Subject Name"),
            content: Container(
                child: TextFormField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "title",
              ),
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(child: Text("")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          createAlertDialog(context);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [HexColor("#FF8A00"), HexColor("#C34332")])),
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}

class AssignSubject extends StatefulWidget {
  @override
  _AssignSubjectState createState() => _AssignSubjectState();
}

class _AssignSubjectState extends State<AssignSubject> {
   String chooseValue;

  List dropList = ["Class 1", "Class 2", "Class 3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Column(children: [
          Padding(
            padding: EdgeInsets.only(top:20.0),
            child: Center(
              child: Container(
                          decoration: BoxDecoration(
                            
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: HexColor("#C34332").withOpacity(0.2)
                            ),
                            // color: Colors.black,
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
                        ),
            ),
          )
        ],)
      ),
    );
  }
}