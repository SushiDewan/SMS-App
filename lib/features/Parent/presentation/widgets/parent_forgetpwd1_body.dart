import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smsapp/features/Parent/presentation/widgets/parent_verificode_body.dart';


class ParentForgetPwd1Body extends StatefulWidget {
  @override
  _ParentForgetPwd1BodyState createState() => _ParentForgetPwd1BodyState();
}

class _ParentForgetPwd1BodyState extends State<ParentForgetPwd1Body> {
  @override
  Widget build(BuildContext context) {
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
              Stack(children: [
                ClipRRect(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                   
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            color: Colors.black,
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Forget Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                    child: Padding(
                      padding: EdgeInsets.only(top:50, left: 50),
                                          child: Container(
                        height: 300,
                        width: 300,
                        // child: Icon(Icons.l, size: 100,),
                  decoration: BoxDecoration(
                    
                        image: DecorationImage(
                            image: AssetImage('assets/images/test.png'), fit: BoxFit.fill)),
                ),
                    ))
              ]),

              SizedBox(height: 50),
              Container(
                
                child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        Text(
                          "Please enter a new Password",
                          // textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                       
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left:30.0, right: 30),
                          child: Material(
                            color: Colors.transparent,
                            // elevation: 10,
                            child: TextField(
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              // textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              // controller: _myController,
                              decoration: InputDecoration(
                                hintText: 'New Password',
                              
                                hintStyle: TextStyle(fontSize: 13),
                                prefixIcon: Icon(
                                  FontAwesomeIcons.key,
                                  color: Colors.deepPurple,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height:20),
                        Padding(
                          padding: EdgeInsets.only(left:30.0, right: 30),
                          child: Material(
                            color: Colors.transparent,
                            // elevation: 10,
                            child: TextField(
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              
                              cursorColor: Colors.black,
                              // controller: _myController,
                              decoration: InputDecoration(
                                
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(fontSize: 13),
                                prefixIcon: Icon(
                                  FontAwesomeIcons.key,
                                  color: Colors.deepPurple,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                              ),
                            ),
                          ),
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
                                              return ParentVeriCodeBody();
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
                          // color: Hexcolor('#B9E2DA'),
                          color: Colors.deepPurple,
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

// class ForgotClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.moveTo(size.width - (size.width / 2), size.height);

//     path.lineTo(size.width, size.height);
//     path.quadraticBezierTo(
//         size.width / 2, size.height - 20, size.width / 4, size.height);
//     path.lineTo(size.width, 0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }