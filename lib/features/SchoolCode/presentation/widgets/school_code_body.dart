import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smsapp/features/Card/presentation/pages/choose_user_page.dart';
import 'package:smsapp/features/ForgetSchoolCode/presentation/widgets/forget_sclcode_body.dart';
import 'package:smsapp/features/SchoolCode/data/models/school_id_models.dart';
import 'package:http/http.dart' as http;
import 'package:smsapp/core/api/strings.dart';
import 'dart:convert';

class SchoolCodeBody extends StatefulWidget {
  @override
  _SchoolCodeBodyState createState() => _SchoolCodeBodyState();
}

class _SchoolCodeBodyState extends State<SchoolCodeBody> {
  FocusNode currentFocus = FocusNode();
  final _myController = TextEditingController();

///////////////////
//////
/////
  Future<SchoolIdModel> getId(String id) async {
    final response =
        await http.post(Uri.parse(Strings.School_ID_API_KEY), body: {"Id": id});
    if (response.statusCode == 201) {
      return SchoolIdModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
////
//////////
/////////////////


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: 100,
            child: Container(
              child: Image.asset(
                "assets/images/schCode.png",
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ),
          ),
          ClipPath(
            clipper: Clipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.bottomRight, colors: [HexColor("#F7A529"), HexColor("#FFCC00")]),
              ),
              height: MediaQuery.of(context).size.height / 2.5,
            ),
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Column(
                children: [
                  SizedBox(height: 260),
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "School Code",
                          style: TextStyle(fontSize: 22, fontFamily: 'Varela', fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      )),
                  SizedBox(height: 20),
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
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 400),
                                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                                    return ForgetSchoolCode();
                                  },
                                  transitionsBuilder:
                                      (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                                    return Align(
                                      child: SlideTransition(
                                        position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation),
                                        child: child,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },

                ]),
                // SizedBox(height: 5),
//                 Padding(
//                   padding: EdgeInsets.only(right: 10.0),
//                   child: Align(
//                       alignment: Alignment.bottomRight,
//                       child: TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               PageRouteBuilder(
//                                 transitionDuration: Duration(milliseconds: 400),
//                                 pageBuilder: (BuildContext context,
//                                     Animation<double> animation,
//                                     Animation<double> secondaryAnimation) {
//                                   return ForgetSchoolCode();
//                                 },
//                                 transitionsBuilder: (BuildContext context,
//                                     Animation<double> animation,
//                                     Animation<double> secondaryAnimation,
//                                     Widget child) {
//                                   return Align(
//                                     child: SlideTransition(
//                                       position: Tween(
//                                               begin: Offset(1.0, 0.0),
//                                               end: Offset(0.0, 0.0))
//                                           .animate(animation),
//                                       child: child,
//                                     ),
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                           child: Text(
//                             "Forget Your Code?",
//                             style: TextStyle(color: HexColor("#F7A529")),
//                           ))),
//                 ),
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
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return ChooseUserPage();
                              },
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return Align(
                                  child: SlideTransition(
                                    position: Tween(
                                            begin: Offset(1.0, 0.0),
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
                              "Forget Your Code?",
                              style: TextStyle(color: HexColor("#F7A529")),
                            ))),
                  ),

                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 120, right: 20)
                ),

//Register School Code

                // SizedBox(height: 10),
                // Padding(
                //     padding: EdgeInsets.only(left: 120, right: 20),
                //     child: TextButton(
                //         onPressed: () {
                //           Navigator.push(
                //                           context,
                //                           PageRouteBuilder(
                //                             transitionDuration:
                //                                 Duration(milliseconds: 400),
                //                             pageBuilder: (BuildContext context,
                //                                 Animation<double> animation,
                //                                 Animation<double>
                //                                     secondaryAnimation) {
                //                               return RegisterAdmin();
                //                             },
                //                             transitionsBuilder:
                //                                 (BuildContext context,
                //                                     Animation<double> animation,
                //                                     Animation<double>
                //                                         secondaryAnimation,
                //                                     Widget child) {
                //                               return Align(
                //                                 child: SlideTransition(
                //                                   position: Tween(
                //                                           begin:
                //                                               Offset(1.0, 0.0),
                //                                           end: Offset(0.0, 0.0))
                //                                       .animate(animation),
                //                                   child: child,
                //                                 ),
                //                               );
                //                             },
                //                           ),
                //                         );
                //         },
                //         child: RichText(
                //             text: TextSpan(
                //                 text: "Don't have Code? ",
                //                 style: TextStyle(
                //                     color: Colors.black,
                //                     fontWeight: FontWeight.w500,
                //                     fontSize: 15),
                //                 children: [
                //               TextSpan(
                //                   text: "Register",
                //                   style: TextStyle(
                //                       color: HexColor("#F7A529"),
                //                       fontSize: 18,
                //                       decoration: TextDecoration.underline))
                //             ])))),

//End of register school code

                Expanded(
                  child: ClipPath(
                    clipper: FooterWaveClipper(),

                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.0,
                      decoration: ShapeDecoration(
                        color: HexColor('#B9E2DA'),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 400),
                                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                                  return ChooseUserPage();
                                },
                                transitionsBuilder:
                                    (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                                  return Align(
                                    child: SlideTransition(
                                      position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation),
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
                            style: TextStyle(color: Colors.white, fontFamily: "Varela", fontWeight: FontWeight.w600),
                          ))),
                    ),
                  ),
                  Expanded(
                    child: ClipPath(
                      clipper: FooterWaveClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft, end: Alignment.bottomRight, colors: [HexColor("#F7A529"), HexColor("#FFCC00")])),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
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

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

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
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
//       resizeToAvoidBottomInset: false,
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(new FocusNode());
//         },
//         child: Container(
//           height: double.infinity,
//               width: MediaQuery.of(context).size.width,
//               // color: Colors.white,
//           // decoration: BoxDecoration(
//           //     image: DecorationImage(
//           //   image: AssetImage("assets/images/loginBack.jpg"),
//           //   fit: BoxFit.cover,
//           // )
//           // ),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_back),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       color: Colors.white,
//                       iconSize: 40,
//                     ),
//                   ),
//                   Container(
//                       padding: EdgeInsets.only(left: 135, top: 10),
//                       child: Align(
//                         child: FlatButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => RegisterAdmin()));
//                           },
//                           child: Text(
//                             "Register Your School",
//                             style: TextStyle(
//                                 color: Colors.red,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: "Raleway"),
//                           ),
//                         ),
//                       )),
//                 ],
//               ),
//               Container(
//                   padding: EdgeInsets.only(top: 250),
//                   child: Text(
//                     "Enter Your School Code",
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontFamily: 'Varela ',
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   )),
//               Padding(
//                 padding: const EdgeInsets.only(top: 25, left: 65, right: 65),
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   cursorColor: Colors.white,
//                   controller: _myController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     contentPadding: EdgeInsets.symmetric(vertical: 10),
//                     enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )),

//     );
//   }
// }
