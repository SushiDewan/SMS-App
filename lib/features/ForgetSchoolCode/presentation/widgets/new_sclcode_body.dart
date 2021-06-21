import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smsapp/features/Login/loginAdmin.dart';

class NewSchoolCode extends StatefulWidget {
  @override
  _NewSchoolCodeState createState() => _NewSchoolCodeState();
}

class _NewSchoolCodeState extends State<NewSchoolCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
             
                children: [IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text("Forget Your Code", style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Varela'))
                ]),
            ),
            SizedBox(height: 120),
            Container(
                child: Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("New Code", style: TextStyle(fontFamily:'Varela', fontWeight:FontWeight.w500),))),
                  SizedBox(height: 10),
                  Material(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                          padding: EdgeInsets.only(left: 40, right: 20),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              
                                border: InputBorder.none,
                                hintText: "New Code",
                                hintStyle: TextStyle(
                                    color: Color(0xFFE1E1E1), fontSize: 14)),
                          ))),
                  SizedBox(height: 30),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Re-enter Code",style: TextStyle(fontFamily:'Varela', fontWeight:FontWeight.w500)))),
                  SizedBox(height: 10),
                  Material(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                          padding: EdgeInsets.only(left: 40, right: 20),
                          child: TextField(
                             keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Re-enter Code",
                                hintStyle: TextStyle(
                                    color: Color(0xFFE1E1E1), fontSize: 14)),
                          ))),

                           SizedBox(height: 50),
                            Padding(
                              padding: EdgeInsets.only(left: 120, right: 10),
                              child: MaterialButton(
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  onPressed: () {
                                     Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            transitionDuration:
                                                Duration(milliseconds: 400),
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation) {
                                              return LoginAdmin();
                                            },
                                            transitionsBuilder:
                                                (BuildContext context,
                                                    Animation<double> animation,
                                                    Animation<double>
                                                        secondaryAnimation,
                                                    Widget child) {
                                              return Align(
                                                child: SlideTransition(
                                                  position: Tween(
                                                          begin:
                                                              Offset(1.0, 0.0),
                                                          end: Offset(0.0, 0.0))
                                                      .animate(animation),
                                                  child: child,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                  },
                                  elevation: 10,
                                  color: HexColor('#B9E2DA'),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Submit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Varela",
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 30,
                                          color: Colors.white,
                                        )
                                      ])),
                            ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}