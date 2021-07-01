import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smsapp/features/Parent/presentation/widgets/parent_forgetpwd1_body.dart';
// import 'package:hexcolor/hexcolor.dart';


class ParentForgetPwdBody extends StatefulWidget {
  @override
  _ParentForgetPwdBodyState createState() => _ParentForgetPwdBodyState();
}

class _ParentForgetPwdBodyState extends State<ParentForgetPwdBody> {
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
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.only(
                    //         bottomLeft: Radius.circular(40),
                    //         bottomRight: Radius.circular(40)),
                    //     gradient: LinearGradient(
                    //         begin: Alignment.centerLeft,
                    //         end: Alignment.bottomRight,
                    //         colors: [
                    //           Hexcolor("#F7A529"),
                    //           Hexcolor("#FFCC00")
                    //         ])),
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
                          child: Material(
                            color: Colors.transparent,
                            // elevation: 10,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              // textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              // controller: _myController,
                              decoration: InputDecoration(
                                hintText: 'Email/Phone',
                                hintStyle: TextStyle(fontSize: 12, fontFamily: 'Varela'),
                                prefixIcon: Icon(
                                  FontAwesomeIcons.userAlt,
                                  color: Colors.deepPurple,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                              ),
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
                                            transitionDuration:
                                                Duration(milliseconds: 400),
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation) {
                                              return ParentForgetPwd1Body();
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
                          // color: Hexcolor('#B9E2DA'),
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
