import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:smsapp/BLoc/UserInformation.dart';
import 'package:smsapp/core/api/APIWithoutAuthentication.dart';
import 'package:smsapp/features/Admin/admin_dashboard_body.dart';
import 'package:smsapp/features/ForgotPassword/forget_password_body.dart';
import 'package:smsapp/CustomWidget/TextField.dart';
import 'dart:math';
import 'package:smsapp/features/Login/registerPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    String username = _usernameController.text;
    String password = _passwordController.text;
    APIwithoutAuthentication api = APIwithoutAuthentication();
    api.post(
      "school/user/login/admin/",
      jsonEncode({"username": username, "password": password}),
      (Response response) {
        setState(() {
          isLoading = false;
        });
        Map data = jsonDecode(response.body);
        print(response.body);
        Fluttertoast.showToast(
          msg: data['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor:
              data['statusCode'] == 200 ? Colors.green : Colors.red,
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdminDashboardBody()));
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
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
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
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                color: Theme.of(context).primaryColor, //change your color here
              ),
            ),
            body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text("Hello!",
                          style: TextStyle(
                              fontFamily: "Varela",
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor)),
                      Text(
                        "Sign in to your account",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Varela",
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).accentColor),
                      ),
                      SizedBox(height: 60),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              FormInputField(
                                controller: _usernameController,
                                hintText: "Username",
                                icon: FontAwesomeIcons.userAlt,
                                validator: (value) {
                                  if (value == '' || value == null)
                                    return "Username cannot be empty";
                                  return null;
                                },
                                errorText: null,
                              ),
                              SizedBox(height: 20),
                              FormInputField(
                                controller: _passwordController,
                                hintText: "Password",
                                icon: Icons.lock,
                                validator: (value) {
                                  if (value == '' || value == null)
                                    return "Password cannot be empty";
                                  return null;
                                },
                                errorText: null,
                                obscureText: !isVisiblePassword,
                                suffix: !isVisiblePassword
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                                onSuffixPressed: () {
                                  setState(() {
                                    isVisiblePassword = !isVisiblePassword;
                                  });
                                },
                              ),
                              SizedBox(height: 40),
                              Padding(
                                      padding: EdgeInsets.only(left: 120, right: 0),
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
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  child: Text(
                                    "Forget Password?",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 15,
                                        fontFamily: "Varela"),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgetPasswordBody()));
                                  },
                                ),
                              ),
                              SizedBox(height: 40),
                              InkWell(
                                child: RichText(
                                  text: TextSpan(
                                      text: "Haven't registered Yet? ",
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontSize: 14,
                                          fontFamily: "Varela"),
                                      children: [
                                        TextSpan(
                                            text: "Register",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Theme.of(context)
                                                    .primaryColor))
                                      ]),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterPage()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ))
                    ]),
              ),
            ),
          ),
        ],
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
