import 'package:flutter/material.dart';
import 'package:smsapp/CustomWidget/TextField.dart';

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
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          title: Center(
            child: Text(
              "Timetable",
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 0.95,
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
            indicatorSize: TabBarIndicatorSize.tab,
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
                  "Create timetable".toUpperCase(),
                  style: TextStyle(
                    fontSize: 13,
                      fontFamily: "Varela",
                      letterSpacing: 0.9,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  "view timetable".toUpperCase(),
                  style: TextStyle(
                    fontSize: 13,
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
        body: TabBarView(controller: _tabController, children: <Widget>[
          CreateTimetable(),
          ViewTimetable(),
         
        ]),
      ),
    );
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
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
                  children: [
            Row(
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
                    border: Border.all(color: Theme.of(context).primaryColor)),
                  
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
                      underline: SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
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
                    border: Border.all(color: Theme.of(context).primaryColor),
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
                      underline: SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time From :",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Varela'),
                ),
                Container(
                  width: 145,
                  height: 40,
                  child: FormInputField()
                )
              ],
            )),
            SizedBox(height: 20),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time To :",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Varela"),
                ),
                Container(
                  width: 145,
                  height: 40,
                  child: FormInputField(
                   
                  ),
                )
              ],
            )),
            SizedBox(height: 40),
            TextButton(
              onPressed: (){},
              child: Center(
                child:Text(
                        "CREATE",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Varela",
                            fontWeight: FontWeight.w600),
                      ),
              ),
            ),
                  ],
            ))
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
