import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smsapp/features/ForgetSchoolCode/presentation/widgets/forget_sclcode_body.dart';
import 'package:smsapp/features/Parent/loginParent.dart';



class SchoolCodeParent extends StatefulWidget {
  @override
  _SchoolCodeParentState createState() => _SchoolCodeParentState();
}

class _SchoolCodeParentState extends State<SchoolCodeParent> {
  FocusNode currentFocus = FocusNode();
  final _myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Stack(alignment: Alignment.bottomCenter, children: [
                  Image.asset(
                    "assets/images/schCode.png",
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                  ClipPath(
                      clipper: Clipper(),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                HexColor("#F7A529"),
                                HexColor("#FFCC00")
                              ])
                              //  HexColor("")
                              ),
                          height: MediaQuery.of(context).size.height / 2.5,
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Container(
                                child: (Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back_ios),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    color: Colors.black,
                                    iconSize: 30,
                                  ),
                                )),
                              ),
                            ),
                            // Container(
                            //     decoration: BoxDecoration(
                            //         image: DecorationImage(
                            //             image:
                            //                 AssetImage("assets/images/sclCode.jpg"))),
                            //     child: Text("hello"),
                            //   ),
                          ]))),
                ]),
                SizedBox(height: 40),
                Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "School Code",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Varela',
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    )),
                SizedBox(height: 20),
                Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Material(
                      color: Colors.transparent,
                      // elevation: 10,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        controller: _myController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 20.0, right: 30),
                  //   child: Align(
                  //     alignment: Alignment.bottomRight,
                  //     child: Container(
                  //       padding: EdgeInsets.all(10),
                  //       decoration: ShapeDecoration(
                  //           shape: CircleBorder(),
                  //           gradient: LinearGradient(
                  //               begin: Alignment.centerLeft,
                  //               end: Alignment.bottomRight,
                  //               colors: [
                  //                 HexColor("#D9645D"),
                  //                 HexColor("#F7A529")
                  //               ])),
                  //       child: Icon(
                  //         Icons.arrow_forward_ios_sharp,
                  //         size: 30,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ]),
                // SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
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
                                              return ForgetSchoolCode();
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
                          child: Text(
                            "Forget Your Code?",
                            style: TextStyle(color: HexColor("#F7A529")),
                          ))),
                ),
                SizedBox(height: 40),
                // Container(
                //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                // Container(
                //   height: 50,
                //   width: MediaQuery.of(context).size.width / 1.7,
                //   child: RaisedButton(
                //       onPressed: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => RegisterAdmin()));
                //       },
                //       color: HexColor("#B9E2DA"),
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(25),
                //           side: BorderSide(color: HexColor("#B9E2DA"))),
                //       child: Text("Register Your School")),
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 120, right: 20),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.0,
                    decoration: ShapeDecoration(
                      color: HexColor('#B9E2DA'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: InkWell(
                        onTap: () {
                         Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            transitionDuration:
                                                Duration(milliseconds: 400),
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation) {
                                              return LoginParent();
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
                        child: Center(
                            child: Text(
                          "SUBMIT",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Varela",
                              fontWeight: FontWeight.w600),
                        ))),
                  ),
                ),
                SizedBox(height: 10),
               
                Expanded(
                  child: ClipPath(
                    clipper: FooterWaveClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              colors: [
                            HexColor("#F7A529"),
                            HexColor("#FFCC00")
                          ])),
                      // height: MediaQuery.of(context).size.height/5,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move from bottom right to top
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height - 60);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
