import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smsapp/BLoc/UserInformation.dart';
import 'package:smsapp/Classes/User.dart';
import 'package:smsapp/CustomWidget/TextField.dart';
import 'package:smsapp/features/Admin/dashboard_body.dart';
import 'package:smsapp/features/ForgotPassword/forget_password1_body.dart';
import 'dart:math';

import 'package:smsapp/features/Login/registerPage.dart';

class LoginAdmin extends StatefulWidget {
  @override
  _LoginAdminState createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isVisiblePassword = false;

  doLogin() {
    print(_formKey.currentState.validate());
    if (!_formKey.currentState.validate()) return;
    setState(() {
      isLoading = true;
    });

    User user = new User();

    String username = _usernameController.text;
    String password = _passwordController.text;

    user.login(
        username: username,
        password: password,
        onSuccess: (message, data) {
          setState(() {
            isLoading = false;
          });
          BlocProvider.of<SchoolBloc>(context).setUserInfo(
            data['access'].toString(),
            data['refresh'].toString(),
          );
          Fluttertoast.showToast(
            msg: message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboardBody()));
        },
        onFailure: (error) {
          setState(() {
            isLoading = false;
          });

          Fluttertoast.showToast(
            msg: error['message'].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        },
        onError: (error) {
          setState(() {
            isLoading = false;
          });
          print("error");
          print(error);
        });
  }

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
                              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.centerRight, colors: [
                            Theme.of(context).primaryColor,
                            Theme.of(context).accentColor,
                          ])),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                      ),
                    ),
                  ),
                  Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.amber,
                      iconTheme: IconThemeData(
                        color: Colors.black, //change your color here
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    body: SingleChildScrollView(
                      child: Center(
                        child: Container(
                          width: 300,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            SizedBox(height: 70),
                            Text("Hello!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                            Text(
                              "Sign in to your account",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    FormInputField(
                                      controller: _usernameController,
                                      hintText: "Username",
                                      icon: FontAwesomeIcons.userAlt,
                                      validator: (value) {
                                        if (value == '' || value == null) return "Username cannot be empty";
                                        return null;
                                      },
                                      errorText: null,
                                    ),
                                    SizedBox(height: 10),
                                    FormInputField(
                                      controller: _passwordController,
                                      hintText: "Password",
                                      icon: Icons.lock,
                                      validator: (value) {
                                        if (value == '' || value == null) return "Password cannot be empty";
                                        return null;
                                      },
                                      errorText: null,
                                      obscureText: !isVisiblePassword,
                                      suffix: !isVisiblePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                                      onSuffixPressed: () {
                                        setState(() {
                                          isVisiblePassword = !isVisiblePassword;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: EdgeInsets.only(left: 80, right: 0),
                                      child: TextButton(
                                        onPressed: isLoading ? null : doLogin,
                                        child: Center(
                                          child: isLoading
                                              ? SizedBox(
                                                  width: 17,
                                                  height: 17,
                                                  child: CircularProgressIndicator(
                                                    color: Colors.white,
                                                    strokeWidth: 2,
                                                  ),
                                                )
                                              : Text(
                                                  "SUBMIT",
                                                  style: TextStyle(color: Colors.white, fontFamily: "Varela", fontWeight: FontWeight.w600),
                                                ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: InkWell(
                                        child: Text(
                                          "Forget Password?",
                                          style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Varela"),
                                        ),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword1Body()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    Container(
                                      child: InkWell(
                                        child: RichText(
                                          text: TextSpan(
                                              text: "Haven't registered Yet? ",
                                              style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Varela"),
                                              children: [
                                                TextSpan(
                                                    text: "Register",
                                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: HexColor('#F7A529')))
                                              ]),
                                        ),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
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
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    /// [Left Middle]
    var fifthControlPoint = Offset(width * .3, height * .5);
    var fiftEndPoint = Offset(width * .23, height * .6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy, fiftEndPoint.dx, fiftEndPoint.dy);

    /// [Bottom Left corner]
    var thirdControlPoint = Offset(0, height);
    var thirdEndPoint = Offset(width, height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

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
