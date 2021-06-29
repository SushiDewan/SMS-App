import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smsapp/features/ForgotPassword/presentation/pages/forget_password_page.dart';
import 'package:smsapp/features/Teacher/presentation/pages/teacher_dashboard_page.dart';
import 'dart:math';



class TeacherLoginBody extends StatefulWidget {
  @override
  _TeacherLoginBodyState createState() => _TeacherLoginBodyState();
}

class _TeacherLoginBodyState extends State<TeacherLoginBody> {
  // final _formController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
         onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
              child: Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width,

            child: Column(
              children: [
               Expanded(
                    child: Stack(children: [
                      Positioned(
                        top: -height * .18,
                        right: -MediaQuery.of(context).size.width * .4,
                        child: Transform.rotate(
                          angle: -pi / 3.5,
                          child: ClipPath(
                            clipper: TopClipper(),
                            child: Container(
                              decoration: BoxDecoration(
                              gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.centerRight,
                              colors: [HexColor("#F7A529"), HexColor("#FFCC00")])),
                              width: MediaQuery.of(context).size.width,
                              // decoration: BoxDecoration(
                              //   color: HexColor("#B9E2DA"),
                              //   //  HexColor("")
                              // ),
                              height: MediaQuery.of(context).size.height/2,
                              
                            ),
                          ),
                        ),
                      ),
                      Column(children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Container(
                                    child: (Align(
                                      alignment: Alignment.topLeft,
                                      child: IconButton(
                                        icon: Icon(Icons.arrow_back),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        color: Colors.black,
                                        iconSize: 40,
                                      ),
                                    )),
                                  ),
                                ),
                                SizedBox(height: 70),
                                Center(
                                    child: Text("Hello!",
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.w600))),
                                // SizedBox(height:10),
                                Center(
                                    child: Text(
                                  "Sign in to your account",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w500),
                                )),
                         SizedBox(height:180),       
            Container(
            
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Column(
                children: [
                  Material(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                          padding: EdgeInsets.only(left: 40, right: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(FontAwesomeIcons.userAlt),
                                border: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(
                                    color: Color(0xFFE1E1E1), fontSize: 14)),
                          ))),
                  SizedBox(height: 30),
                  Material(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                          padding: EdgeInsets.only(left: 40, right: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(FontAwesomeIcons.lock),
                                border: InputBorder.none,
                                hintText: "Password",
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
                                              return TeacherDashboardPage();
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "SUBMIT",
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
                  SizedBox(height:10),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(child: Text("Forget Password?"), onPressed: (){

                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            transitionDuration:
                                                Duration(milliseconds: 400),
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation) {
                                              return ForgetPasswordPage();
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
                      })),
                      
                      ]),
                      
                      )
                              ]),
                    ]),
                  ),
    
              ],
            ),
          ),
        ),

    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = new Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, height);
    path.lineTo(size.width, 0);

    /// [Top Left corner]
    var secondControlPoint = Offset(0, 0);
    var secondEndPoint = Offset(width * .2, height * .3);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    /// [Left Middle]
    var fifthControlPoint = Offset(width * .3, height * .5);
    var fiftEndPoint = Offset(width * .23, height * .6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fiftEndPoint.dx, fiftEndPoint.dy);

    /// [Bottom Left corner]
    var thirdControlPoint = Offset(0, height);
    var thirdEndPoint = Offset(width, height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
