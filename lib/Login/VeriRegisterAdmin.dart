import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:smsapp/Login/loginAdmin.dart';
import 'dart:math';
import 'package:hexcolor/hexcolor.dart';
class RegisterVeriCode extends StatefulWidget {
  @override
  _RegisterVeriCodeState createState() => _RegisterVeriCodeState();
}

class _RegisterVeriCodeState extends State<RegisterVeriCode> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
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
                        clipper: Clipper(),
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
                        padding: EdgeInsets.only(top: 10),
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
                         SizedBox(height: 200),
              Container(
                child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        Text(
                          "Please enter Your Verification Code",
                          // textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 40),
                        Text(
                          "We have sent a verification code to your registered Email ID",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 13),
                        ),
                        SizedBox(height: 40),
                        Padding(
                            padding: EdgeInsets.only(left: 60.0, right: 60),
                            child: PinPut(
                              textStyle: TextStyle(color: Colors.orange),
                              fieldsCount: 4,
                              eachFieldHeight: 40,
                              eachFieldWidth: 40,
                              pinAnimationType: PinAnimationType.fade,
                              selectedFieldDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orange)),
                              submittedFieldDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orange)),
                              followingFieldDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orange)),
                            )),
                        SizedBox(height: 70),
                        MaterialButton(
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginAdmin()));
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
                    )),
              ),
                  ],)
                ]),
              ),

             
              // SizedBox(height:30),
              // Expanded(
              //         child: ClipPath(
              //           clipper: ForgotClipper(),
              //           child: Container(

              //             color: Colors.red,
              //           ),
              //         ),

              // )
            ],
          ),
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
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
