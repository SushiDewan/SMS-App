import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smsapp/features/ForgetSchoolCode/presentation/widgets/forget_sclcode1_body.dart';

class ForgetSchoolCode extends StatefulWidget {
  @override
  _ForgetSchoolCodeState createState() => _ForgetSchoolCodeState();
}

class _ForgetSchoolCodeState extends State<ForgetSchoolCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: [
            Row(children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.black,
                  iconSize: 30,
                ),
              ),
              Text("Forgot Your Code",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Varela',
                      fontWeight: FontWeight.w600))
            ]),
            SizedBox(height: 120),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0),
              child: Column(
                children: [Text(
                  "Please enter Your registered Email ID/Phone",
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Varela",
                      fontSize: 13),
                ),
          
              SizedBox(height: 40),
              Text(
                "We'll send a verification code to your registerd email Id/Phone",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontFamily: 'Varela',
                    fontSize: 12),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10),
                child: Material(
                  color: Colors.transparent,
                  // elevation: 10,
                  child: TextField(
                   
                    // textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    // controller: _myController,
                    decoration: InputDecoration(
                      hintText: 'Email/Phone',
                      hintStyle: TextStyle(fontSize: 12, fontFamily: 'Varela'),
                      prefixIcon: Icon(
                        FontAwesomeIcons.userAlt,
                        color: HexColor('#F7A529'),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ),  ]),
            ),
            SizedBox(height: 70),
            MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                                              return ForgetSchoolCode1();
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
              // color: HexColor('#B9E2DA'),
              color: HexColor('#B9E2DA'),
              child: Padding(
                padding: EdgeInsets.only(left: 80, right: 80),
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Varela",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}