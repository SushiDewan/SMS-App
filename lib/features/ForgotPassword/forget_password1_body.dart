import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smsapp/Classes/User.dart';
// import 'package:hexcolor/hexcolor.dart';
import 'package:smsapp/features/ForgotPassword/verifi_code_body.dart';

class ForgetPassword1Body extends StatefulWidget {
  String email;
  ForgetPassword1Body({this.email});
  @override
  _ForgetPassword1BodyState createState() => _ForgetPassword1BodyState();
}

class _ForgetPassword1BodyState extends State<ForgetPassword1Body> {
  User user = new User();

  var passwordController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user.forgetEmailConfirm(widget.email);
  }

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
          child: ListView(
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
                            child: Text("Forget Password", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                    child: Padding(
                  padding: EdgeInsets.only(top: 50, left: 50),
                  child: Container(
                    height: 300,
                    width: 300,
                    // child: Icon(Icons.l, size: 100,),
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/test.png'), fit: BoxFit.fill)),
                  ),
                ))
              ]),
              SizedBox(height: 10),
              Container(
                child: Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Column(
                      children: [
                        Text(
                          "Please enter a new Password\nWe sent code to your email, please check\n${widget.email}",
                          // textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 40),
                        TextField(
                          obscureText: true,
                          controller: passwordController,
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
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          obscureText: true,
                          cursorColor: Colors.black,
                          // controller: _myController,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(fontSize: 13),
                            prefixIcon: Icon(
                              FontAwesomeIcons.key,
                              color: Colors.deepPurple,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                        SizedBox(height: 70),
                        MaterialButton(
                          height: 50,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 400),
                                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                                  return VerificationCode(email: widget.email, password: passwordController.text);
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
                          elevation: 10,
                          // color: Hexcolor('#B9E2DA'),
                          color: Colors.deepPurple,
                          child: Padding(
                            padding: EdgeInsets.only(left: 80, right: 80),
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white, fontFamily: "Varela", fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
