import 'package:flutter/material.dart';
import 'package:smsapp/core/widgets/build_button.dart';
import 'package:smsapp/core/widgets/build_text_form_field.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_verificode_body.dart';


class AdminForgetPwd1Body extends StatefulWidget {
  @override
  _AdminForgetPwd1BodyState createState() => _AdminForgetPwd1BodyState();
}

class _AdminForgetPwd1BodyState extends State<AdminForgetPwd1Body> {
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
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      children: [
                        Text(
                          "Please enter a new Password",
                          // textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                       
                        SizedBox(height: 40),
                        BuildTextFormField(hintText: "New Password",),
                        SizedBox(height:20),
                         BuildTextFormField(hintText: "Confirm Password",),
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
                                              return AdminVeriCodeBody();
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
