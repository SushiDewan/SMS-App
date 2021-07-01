import 'package:flutter/material.dart';
// import 'package:HexColor/HexColor.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:smsapp/features/LoginAdmin/presentation/pages/login_admin_page.dart';

class AdminVeriCodeBody extends StatefulWidget {
  @override
  _AdminVeriCodeBodyState createState() => _AdminVeriCodeBodyState();
}

class _AdminVeriCodeBodyState extends State<AdminVeriCodeBody> {
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
                          padding: EdgeInsets.only(left:60.0, right: 60),
                          child: PinPut(
                            textStyle: TextStyle(color: Colors.deepPurple),
                            fieldsCount: 4,
                            eachFieldHeight: 40,
                            eachFieldWidth: 40,
                            pinAnimationType: PinAnimationType.fade,
                            selectedFieldDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:Colors.deepPurple)
                            ),
                             submittedFieldDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:Colors.deepPurple)
                            ),
                             followingFieldDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:Colors.deepPurple)
                            ),
                          )
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
                                            transitionDuration:
                                                Duration(milliseconds: 400),
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation) {
                                              return LoginAdminPage();
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
           
            ],
          ),
        ),
      ),
    );
  }
}


