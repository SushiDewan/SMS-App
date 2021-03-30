import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ParentLeave extends StatefulWidget {
  @override
  _ParentLeaveState createState() => _ParentLeaveState();
}

class _ParentLeaveState extends State<ParentLeave> {
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
        body: Container(
            height: double.infinity,
            child: Column(children: [
              Stack(children: <Widget>[
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
                          child: Text("Leave",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black))),
                    ],
                  ),
                )),
              ]),
SizedBox(height:30),

              Container(
                width: 300,
                child: MaterialButton(
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 20,
                    color: HexColor("#F7A529"),
                    onPressed: () {},
                    child: Text("Show Previous leaves")),
              ),
            ])),
            floatingActionButton:FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [
                    HexColor("#FF8A00"),
                    HexColor ("#C34332")
                  ])),
            child: Icon(
              Icons.add,
            ),
          ),

          onPressed: () {
            createAlertDialog(context);
          },
          elevation: 10,
        ),
            );
            
  }
}