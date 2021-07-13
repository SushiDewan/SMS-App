import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:smsapp/features/Login/loginPage.dart';

class VerificationCode extends StatefulWidget {
  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              "Please enter Your Verification Code",
              // textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 40),
            Text(
              "We have sent a verification code to your registered Email ID",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).accentColor, fontSize: 13),
            ),
            SizedBox(height: 40),
            Padding(
                padding: EdgeInsets.only(left: 60.0, right: 60),
                child: PinPut(
                  textStyle: TextStyle(color: Colors.deepPurple),
                  fieldsCount: 4,
                  eachFieldHeight: 40,
                  eachFieldWidth: 40,
                  pinAnimationType: PinAnimationType.fade,
                  selectedFieldDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Theme.of(context).primaryColor)),
                  submittedFieldDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Theme.of(context).primaryColor)),
                  followingFieldDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Theme.of(context).primaryColor)),
                )),
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
                      return LoginPage();
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
