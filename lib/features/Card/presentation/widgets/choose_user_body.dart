import 'package:smsapp/features/Login/loginAdmin.dart';
import 'package:smsapp/features/Parent/loginParent.dart';
import 'package:smsapp/features/SchoolCode/data/models/school_id_models.dart';
import 'package:smsapp/features/Sponsor/loginSponsor.dart';
import 'package:smsapp/features/Teacher/loginTeacher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/animation.dart';
import 'package:smsapp/core/api/api_constants.dart';

class ChooseUserBody extends StatefulWidget {
  String id;
  ChooseUserBody(this.id);
  @override
  _ChooseUserBodyState createState() => _ChooseUserBodyState();
}

class _ChooseUserBodyState extends State<ChooseUserBody> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  SchoolIdModel _schoolId;
  bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = true;

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: false);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutSine,
    );
    _controller.forward();
  }

  Future<SchoolIdModel> getData() async {
    return await ApiConstants().getData(widget.id).then((sclId) {
      return sclId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            child: Column(children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.46,
                  // width: MediaQuery.ofcontext).size.width,
                  // height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      // color: HexColor('#FE8A00'),
                      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                    HexColor('#FE8069'),
                    HexColor('#FE8F7B'),
                  ])),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: RotationTransition(
                        turns: _animation,
                        child: Container(
                          height: 250,
                          width: 275,
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/birdBook.png"))),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: FutureBuilder(
                    future: getData(),
                    builder: (BuildContext context, AsyncSnapshot<SchoolIdModel> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: Text('Please wait its loading...'));
                      } else {
                        if (snapshot.hasError)
                          return Center(child: Text('Error: ${snapshot.error}'));
                        else
                          return Center(
                            child: new Text('${snapshot.data.school}'),
                          ); // snapshot.data  :- get your object which is pass from your downloadData() function
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                  child:
                      GridView.count(padding: EdgeInsets.only(left: 20, right: 20, bottom: 40), crossAxisCount: 2, crossAxisSpacing: 30, children: [
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(50)),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 5),
                  elevation: 10,
                  semanticContainer: true,
                  color: HexColor('#FABA15'),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 300),
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                            return LoginAdmin();
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
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                              height: 75,
                              width: 85,
                              child: Icon(
                                FontAwesomeIcons.userCog,
                                size: 35,
                                color: Colors.white,
                              )),
                        ),
                        Container(
                            child: Center(
                          child: Text(
                            "Admin",
                            style: TextStyle(fontFamily: 'Varela', color: Colors.white),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 5),
                  elevation: 10,
                  semanticContainer: true,
                  color: HexColor('#203656'),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 300),
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                            return LoginTeacher();
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
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                              height: 75,
                              width: 85,
                              child: Icon(
                                FontAwesomeIcons.penNib,
                                size: 35,
                                color: Colors.white,
                              )),
                        ),
                        Container(
                            child: Center(
                                child: Text(
                          "Teacher",
                          style: TextStyle(fontFamily: 'Varela', color: Colors.white),
                        )))
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 5),
                  elevation: 10,
                  semanticContainer: true,
                  color: HexColor('#64CE88'),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 400),
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                            return LoginParent();
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
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                              height: 75,
                              width: 85,
                              child: Icon(
                                FontAwesomeIcons.userFriends,
                                size: 35,
                                color: Colors.white,
                              )),
                        ),
                        Container(
                            child: Center(
                          child: Text(
                            "Parent",
                            style: TextStyle(fontFamily: 'Varela', color: Colors.white),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 5),
                  elevation: 10,
                  semanticContainer: true,
                  color: HexColor('#DC7840'),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 400),
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                            return LoginSponsor();
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
                    child: Column(
                      children: [
                        Center(
                            child: SizedBox(
                                height: 75,
                                width: 85,
                                child: Icon(
                                  FontAwesomeIcons.handsHelping,
                                  size: 35,
                                  color: Colors.white,
                                ))),
                        Container(
                            child: Center(
                                child: Text(
                          "Sponsor",
                          style: TextStyle(color: Colors.white, fontFamily: 'Varela'),
                        )))
                      ],
                    ),
                  ),
                )
              ]))
            ])));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 30);
    // var controllPoint = Offset(50, size.height);
    // var endPoint = Offset(size.width/2, size.height);
    path.quadraticBezierTo(size.width / 5, size.height - 100, size.width / 2, size.height - 40);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height, size.width, size.height - 50);

    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
