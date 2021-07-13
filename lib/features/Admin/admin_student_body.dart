import 'package:flutter/material.dart';

class AdminStudentBody extends StatefulWidget {
  @override
  _AdminStudentBodyState createState() => _AdminStudentBodyState();
}

class _AdminStudentBodyState extends State<AdminStudentBody>
    {
  String chooseValue;
  List dropList = ["Class 1", "Class 2", "Class 3"];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              "Student",
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 0.95,
                fontFamily: "Varela",
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          elevation: 0,),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
    
