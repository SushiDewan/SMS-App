import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smsapp/CustomWidget/TextField.dart';
import 'package:smsapp/features/ForgotPassword/forget_password1_body.dart';
// import 'package:hexcolor/hexcolor.dart';

class ForgetPasswordBody extends StatefulWidget {
  @override
  _ForgetPasswordBodyState createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
 final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(
            'assets/images/test.png',
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),

          SizedBox(height: 50),
          Container(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      "Please enter Your registered Email ID/Phone",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Varela",
                          fontSize: 13),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "We'll send a verification code to your registerd email Id/Phone",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontFamily: 'Varela',
                          fontSize: 12),
                    ),
                    SizedBox(height: 40),
                    FormInputField(
                      icon: FontAwesomeIcons.userAlt,
                      controller:_emailController,
                      validator: (value) {
                        return (value == null || value == '')
                            ? 'Email cannot be empty'
                            : (!EmailValidator.validate(value))
                                ? "Enter valid email"
                                : null;
                      },
                      hintText: "Email/Phone",
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
                              return ForgetPassword1Body();
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
    );
  }
}
