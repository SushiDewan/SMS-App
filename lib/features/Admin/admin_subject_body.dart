
import 'package:flutter/material.dart';
import 'package:smsapp/CustomWidget/TextField.dart';

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
          toolbarHeight: 120,
          title: Center(
            child: Text(
              "Subject",
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
                  "Create subject".toUpperCase(),
                  style: TextStyle(
                      fontFamily: "Varela",
                      letterSpacing: 0.9,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  "Assign subject".toUpperCase(),
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
        body: TabBarView(controller: _tabController, children: <Widget>[
          CreateSubject(),
          AssignSubject(),
         
        ]),
      ),
    );
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
              
              content: Container(
                child: SingleChildScrollView(
                  child: Column(children: [
                    FormInputField(
                      hintText: "Subject Name",
                    ),
                    SizedBox(height: 10,),
                    TextButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "CREATE",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Varela",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ]),
                ),
              ));
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
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Theme.of(context).primaryColor,
                        Theme.of(context).accentColor,])),
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
                      border: Border.all(
                          color: Theme.of(context).primaryColor),
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
                      border: Border.all(
                          color: Theme.of(context).primaryColor),
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
                    "Select Staff:",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Varela",
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Theme.of(context).primaryColor),
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
                       
                        underline: SizedBox(),
                        
                      ),
                    ),
                  ),
                ],
              ),
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
          ),
        ));
  }
}