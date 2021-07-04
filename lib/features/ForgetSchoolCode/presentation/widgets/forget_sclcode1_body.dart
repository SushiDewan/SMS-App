import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smsapp/features/ForgetSchoolCode/presentation/widgets/new_sclcode_body.dart';

class ForgetSchoolCode1 extends StatefulWidget {
  @override
  _ForgetSchoolCode1State createState() => _ForgetSchoolCode1State();
}

class _ForgetSchoolCode1State extends State<ForgetSchoolCode1> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              
                  Column(children: [
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.black,
                              iconSize: 25,
                            ),
                          ),
                          Text("Forget Your Code",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Varela')),
                          ]),
                        ),
                         SizedBox(height: 120),
              Container(
                child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        Text(
                          "Please enter Your Verification Code",
                          // textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 40),
                        Text(
                          "We have sent a verification code to your registered Email ID",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 13),
                        ),
                        SizedBox(height: 40),
                        Padding(
                            padding: EdgeInsets.only(left: 60.0, right: 60),
                            child: PinPut(
                              textStyle: TextStyle(color: Colors.orange),
                              fieldsCount: 4,
                              eachFieldHeight: 40,
                              eachFieldWidth: 40,
                              pinAnimationType: PinAnimationType.fade,
                              selectedFieldDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orange)),
                              submittedFieldDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orange)),
                              followingFieldDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orange)),
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
                                            transitionDuration:
                                                Duration(milliseconds: 400),
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation) {
                                              return NewSchoolCode();
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
                          // color: HexColor('#B9E2DA'),
                          color: HexColor('#B9E2DA'),
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
                  ],)
                ]),
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
          
    ));
  }
}
