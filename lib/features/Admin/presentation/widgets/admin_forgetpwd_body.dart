import 'package:flutter/material.dart';
import 'package:smsapp/core/widgets/build_button.dart';
import 'package:smsapp/core/widgets/build_text_form_field.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_forgetpwd1_body.dart';
// import 'package:hexcolor/hexcolor.dart';


class AdminForgetPwdBody extends StatefulWidget {
  @override
  _AdminForgetPwdBodyState createState() => _AdminForgetPwdBodyState();
}

class _AdminForgetPwdBodyState extends State<AdminForgetPwdBody> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 48.0),
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
                Positioned(
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
                          "Please enter Your registered Email ID/Phone",
                          // textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600, fontFamily: "Varela", fontSize: 13),
                        ),
                        SizedBox(height: 40),
                        Text(
                          "We'll send a verification code to your registerd email Id/Phone",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontFamily: 'Varela',
                              fontSize: 12),
                        ),
                        SizedBox(height: 40),

                        Padding(
                          padding: EdgeInsets.only(left:10.0, right: 10),
                          child: BuildTextFormField(hintText: "Email/Phone",)
                        ),

                        SizedBox(height: 40),
                        BuildButton(
                         title: "Next",
                          onTap: () {
                           Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            transitionDuration:
                                                Duration(milliseconds: 400),
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation) {
                                              return AdminForgetPwd1Body();
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
                          // color: Hexcolor('#B9E2DA'),
                          color: Colors.deepPurple,
                         
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
