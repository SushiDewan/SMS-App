import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:smsapp/BLoc/UserInformation.dart';
import 'package:smsapp/core/api/AdminApi.dart';
import 'package:smsapp/features/Admin/presentation/pages/admin_dashboard_page.dart';
import 'package:smsapp/features/ForgotPassword/presentation/pages/forget_password_page.dart';
import 'package:smsapp/features/Login/Classes/Admin.dart';
import 'dart:math';
import 'package:smsapp/features/Login/registerAdmin.dart';

class LoginAdmin extends StatefulWidget {
  @override
  _LoginAdminState createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  doLogin() {
    print(_formKey.currentState.validate());
    if (!_formKey.currentState.validate()) return;
    setState(() {
      isLoading = true;
    });
    String username = _usernameController.text;
    String password = _passwordController.text;
    AdminLoginAPI api = AdminLoginAPI();
    api.post(
      "school/user/login/admin/",
      {"username": username, "password": password},
      null,
      (Response response) {
        setState(() {
          isLoading = false;
        });
        Map data = jsonDecode(response.body);
        Fluttertoast.showToast(
          msg: data['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: data['statusCode'] == 200 ? Colors.green : Colors.red,
          textColor: Colors.white,
        );
        if (data['statusCode'] == 200) {
          context.read<SchoolBloc>().setUserInfo(
                data['access'].toString(),
                data['refresh'].toString(),
                data['authenticatedUser']['admin_id'].toString(),
                data['authenticatedUser']['username'].toString(),
                data['authenticatedUser']['role'].toString(),
              );
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboardPage()));
        }
      },
      (error) {
        setState(() {
          isLoading = false;
        });
      },
    );
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
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft, end: Alignment.centerRight, colors: [HexColor("#F7A529"), HexColor("#FFCC00")])),
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
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    body: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(height: 70),
                        Center(child: Text("Hello!", style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600))),
                        Center(
                          child: Text(
                            "Sign in to your account",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 180),
                        Container(
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Material(
                                  elevation: 10,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 40, right: 20),
                                    child: TextFormField(
                                      controller: _usernameController,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(FontAwesomeIcons.userAlt),
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14),
                                      ),
                                      validator: (value) {
                                        if (value == '' || value == null) return "Username cannot be empty";
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Material(
                                  elevation: 10,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 40, right: 20),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(FontAwesomeIcons.lock),
                                        border: InputBorder.none,
                                        hintText: "Password2",
                                        hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14),
                                      ),
                                      validator: (value) {
                                        if (value == '' || value == null) return "Password cannot be empty";
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50),
                                Padding(
                                  padding: EdgeInsets.only(left: 120, right: 10),
                                  child: MaterialButton(
                                    height: 50,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    onPressed: isLoading ? null : doLogin,
                                    elevation: 10,
                                    color: HexColor('#B9E2DA'),
                                    disabledColor: HexColor('#B9E2DA'),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "SUBMIT",
                                          style: TextStyle(color: Colors.white, fontFamily: "Varela", fontWeight: FontWeight.w600),
                                        ),
                                        isLoading
                                            ? SizedBox(
                                                height: 20,
                                                width: 20,
                                                child: CircularProgressIndicator(),
                                              )
                                            : Icon(
                                                Icons.arrow_forward,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                        child: Text(
                                          "Forget Password?",
                                          style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Varela"),
                                        ),
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordPage()));
                                        })),
                                SizedBox(height: 40),
                                Container(
                                  child: TextButton(
                                    child: RichText(
                                      text: TextSpan(
                                          text: "Haven't registered Yet? ",
                                          style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Varela"),
                                          children: [
                                            TextSpan(
                                                text: "Register",
                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: HexColor('#F7A529')))
                                          ]),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterAdmin()));
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
