import 'package:flutter/material.dart';
import 'package:smsapp/CustomWidget/TextField.dart';
import 'package:smsapp/features/ForgotPassword/verifi_code_body.dart';

import 'package:flutter/cupertino.dart';

class ForgetPassword1Body extends StatefulWidget {
  @override
  _ForgetPassword1BodyState createState() => _ForgetPassword1BodyState();
}

class _ForgetPassword1BodyState extends State<ForgetPassword1Body> {
  final _passwordController = TextEditingController();
  bool isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Forget Password",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 0.9,
            fontFamily: "Varela",
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Image.asset(
              'assets/images/test.png',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 50),
            Text(
              "Please enter a new Password",
              // textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 40),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FormInputField(
                      icon: Icons.lock,
                      hintText: "New Password",
                      controller: _passwordController,
                      validator: (value) {
                        return (value == null || value == '')
                            ? 'Password cannot be empty'
                            : null;
                      },
                      obscureText: !isVisiblePassword,
                      suffix: isVisiblePassword
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      onSuffixPressed: () {
                        setState(() {
                          isVisiblePassword = !isVisiblePassword;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormInputField(
                      icon: Icons.lock,
                      hintText: "Confirm Password",
                      controller: null,
                      validator: (value) {
                        return (value != _passwordController.text)
                            ? 'Password doesnot match '
                            : null;
                      },
                      obscureText: !isVisiblePassword,
                      suffix: isVisiblePassword
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      onSuffixPressed: () {
                        setState(() {
                          isVisiblePassword = !isVisiblePassword;
                        });
                      },
                    ),
                  ],
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
                    transitionDuration: Duration(milliseconds: 400),
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return VerificationCode();
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
              elevation: 10,
              color: Theme.of(context).primaryColor,
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
        ),
      ),
    );
  }
}
