import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math';

import 'package:smsapp/Login/VeriRegisterAdmin.dart';
import 'package:smsapp/Login/loginAdmin.dart';

class RegisterAdmin extends StatefulWidget {
  @override
  _RegisterAdminState createState() => _RegisterAdminState();
}

class _RegisterAdminState extends State<RegisterAdmin> {
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
        child:  Container(
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
                                    colors: [
                                  HexColor("#F7A529"),
                                  HexColor("#FFCC00")
                                ])),
                            width: MediaQuery.of(context).size.width,
                            // decoration: BoxDecoration(
                            //   color: HexColor("#B9E2DA"),
                            //   //  HexColor("")
                            // ),
                            height: MediaQuery.of(context).size.height / 2,
                          ),
                        ),
                      ),
                    ),
                    Column(children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Row(
                          children: [Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.black,
                              iconSize: 25,
                            ),
                          ),
                          Text("Register",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Varela')),
                          ]),
                        ),
                      
                    
                      // SizedBox(height:10),
                      // Center(
                      //     child: Text(
                      //   "Sign in to your account",
                      //   style: TextStyle(
                      //       fontSize: 15, fontWeight: FontWeight.w500),
                      // )),
                      SizedBox(height: 120),
                      Container(
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: Column(children: [
                            Material(
                                elevation: 10,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 40, right: 20),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          // labelText: "Username",
                                          suffixIcon:
                                              Icon(FontAwesomeIcons.userAlt),
                                          border: InputBorder.none,
                                          hintText: "Username",
                                          hintStyle: TextStyle(
                                              color: Color(0xFFE1E1E1),
                                              fontSize: 14)),
                                    ))),
                            SizedBox(height: 30),

                            Material(
                                elevation: 10,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 40, right: 20),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          // labelText: "Username",
                                          suffixIcon:
                                              Icon(FontAwesomeIcons.userAlt),
                                          border: InputBorder.none,
                                          hintText: "School Name",
                                          hintStyle: TextStyle(
                                              color: Color(0xFFE1E1E1),
                                              fontSize: 14)),
                                    ))),
                            SizedBox(height: 30),
                            Material(
                                elevation: 10,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 40, right: 20),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          // labelText: "Username",
                                          suffixIcon:
                                              Icon(FontAwesomeIcons.userAlt),
                                          border: InputBorder.none,
                                          hintText: "School Code",
                                          hintStyle: TextStyle(
                                              color: Color(0xFFE1E1E1),
                                              fontSize: 14)),
                                    ))),
                            SizedBox(height: 30),
                            Material(
                                elevation: 10,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 40, right: 20),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          // labelText: "Username",
                                          suffixIcon:
                                              Icon(FontAwesomeIcons.userAlt),
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Color(0xFFE1E1E1),
                                              fontSize: 14)),
                                    ))),
                            SizedBox(height: 30),
                            Material(
                                elevation: 10,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 40, right: 20),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          suffixIcon:
                                              Icon(FontAwesomeIcons.lock),
                                          border: InputBorder.none,
                                          hintText: "Re-Enter Password",
                                          hintStyle: TextStyle(
                                              color: Color(0xFFE1E1E1),
                                              fontSize: 14)),
                                    ))),
                                     SizedBox(height: 30),
                                    Material(
                                elevation: 10,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 40, right: 20),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          // labelText: "Username",
                                          suffixIcon:
                                              Icon(FontAwesomeIcons.userAlt),
                                          border: InputBorder.none,
                                          hintText: "Username",
                                          hintStyle: TextStyle(
                                              color: Color(0xFFE1E1E1),
                                              fontSize: 14)),
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
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterVeriCode()));
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
                                          "REGISTER",
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
                            SizedBox(height: 10),
                            Container(
                              child: TextButton(
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Already have an Account? ",
                                        style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Varela"),
                                        children: [
                                          TextSpan(
                                            text:"Login",
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: HexColor('#F7A529'))
                                          )
                                        ]),
                                      
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginAdmin()));
                                  }),
                            )
                          ]))
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

// class FirstClipper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//     // This is where we decide what part of our image is going to be visible.
//     var path = Path();
//   //   path.lineTo(0.0, size.height-180);
//   //  var firstControlPoint = new Offset(size.width / 5, size.height -140);
//   // var firstEndPoint = new Offset(size.width / 3, size.height /6);

//   //   path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//   //       firstEndPoint.dx, firstEndPoint.dy);

//   //   var secondControlPoint = Offset(size.width/4, size.height /6);
//   //   var secondEndPoint = Offset(size.width /2, size.height );
//   //   path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//   //       secondEndPoint.dx, secondEndPoint.dy);

//     // var thirdControlPoint =
//     //     Offset(size.width - (size.width / 9), size.height / 6);
//     // var thirdEndPoint = Offset(size.width, 0.0);
//     // path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
//     //     thirdEndPoint.dx, thirdEndPoint.dy);

//     ///move from bottom right to top
//     path.lineTo(size.width/1.8, 0.0);

//     ///finally close the path by reaching start point from top right corner
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
