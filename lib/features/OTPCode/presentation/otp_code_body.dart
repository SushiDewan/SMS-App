import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smsapp/features/Admin/presentation/pages/admin_dashboard_page.dart';


class OtpCodeBody extends StatefulWidget {
  @override
  _OtpCodeBodyState createState() => _OtpCodeBodyState();
}

class _OtpCodeBodyState extends State<OtpCodeBody> {
  final _formController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          // color: Colors.redAccent,
          height: double.infinity,
          child: Column(children: [
            // ClipPath(
            // clipper: Clipper(),
            Expanded(
              child: Stack(children: [
                ClipRRect(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: HexColor("#B9E2DA"),
                      //   gradient: LinearGradient(
                      //     begin: Alignment.topCenter,
                      //     end: Alignment.bottomCenter,
                      //     colors: [
                      //   Colors.orange,
                      //   Colors.pinkAccent
                      // ])
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              iconSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "S",
                                    style: TextStyle(
                                        fontSize: 70,
                                        fontFamily: "Libre",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.bookOpen,
                                  size: 100,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    "S",
                                    style: TextStyle(
                                        fontSize: 70,
                                        fontFamily: "Libre",
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 280),
                  child: ClipRRect(
                      child: Container(
                    padding: EdgeInsets.only(top: 80, left: 40, right: 40),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 5,
                              color: Colors.black,
                              offset: Offset(0, 15),
                              blurRadius: 7)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text:
                                  "We have sent you the OTP code on your phone. ",
                              children: [
                                TextSpan(
                                    text: "Re-send Code",
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        decoration: TextDecoration.underline))
                              ]),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                          controller: _formController,
                          decoration: InputDecoration(
                            hintText: "Enter OTP Code",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                          controller: _formController,
                          decoration: InputDecoration(
                            hintText: "New School Code",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                          controller: _formController,
                          decoration: InputDecoration(
                            hintText: "Confirm School Code",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2.0,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    HexColor("#F7A529"),
                                    HexColor("#FFCC00")
                                  ])),
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
                                              return AdminDashboardPage();
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
                              child:
                                  Center(child: Text("SUBMIT",style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Varela",
                            fontWeight: FontWeight.w600),))),
                        ),
                        // Container(
                        //   height: 55,
                        //   width: 200,

                        //   child: RaisedButton(
                        //       hoverColor: Colors.redAccent,
                        //       splashColor: Colors.red,
                        //       elevation: 10,

                        //       shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(30.0)),
                        //       onPressed: () {
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) => LoginAdmin()));
                        //       },
                        //       child: Text(
                        //         "Submit",
                        //         style: TextStyle(color: Colors.white),
                        //       )),
                        // )
                      ],
                    ),
                  )),
                ),
              ]),
            ),
          ]),
        ));
  }
}

// class Clipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // This is where we decide what part of our image is going to be visible.
//     var path = Path();
//     path.lineTo(0.0, size.height-120);
//    path.quadraticBezierTo(
//         size.width/12, size.height, size.width, size.height);
//     // path.quadraticBezierTo(size.width, size.height,
//     //     size.width, size.height);

//   path.lineTo(size.width, 0);

//     ///finally close the path by reaching start point from top right corner
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
