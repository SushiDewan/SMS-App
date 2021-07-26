import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:smsapp/BLoc/UserInformation.dart';
import 'package:smsapp/core/api/APIWithoutAuthentication.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smsapp/CustomWidget/TextField.dart';
import 'package:smsapp/features/Login/loginPage.dart';

class SchoolCodeBody extends StatefulWidget {
  @override
  _SchoolCodeBodyState createState() => _SchoolCodeBodyState();
}

class _SchoolCodeBodyState extends State<SchoolCodeBody> {
  FocusNode currentFocus = FocusNode();
  final _myController = TextEditingController();

  bool isLoading = false;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });
    final SchoolBloc schoolBloc = BlocProvider.of<SchoolBloc>(context);
    print(schoolBloc.state.schoolCode);
    String id = _myController.text;
    APIwithoutAuthentication apiCall = new APIwithoutAuthentication();
    apiCall.post("", jsonEncode({'id': id}), (Response response) {
      setState(() {
        isLoading = false;
      });
      if (response.statusCode == 200) {
        Map body = jsonDecode(response.body);
        print(body['school']);
        context.read<SchoolBloc>().setCode(_myController.text, body['school']);
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 400),
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              print(_myController.text);
              return LoginPage();
            },
            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
              return Align(
                child: SlideTransition(
                  position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation),
                  child: child,
                ),
              );
            },
          ),
        );
      }
    }, (error) {
      setState(() {
        isLoading = false;
      });
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: 100,
            child: Container(
              child: Image.asset(
                "assets/images/schCode.png",
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ),
          ),
          ClipPath(
            clipper: Clipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor,
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height / 2.5,
            ),
          ),
         
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child: Column(
                    children: [
                      SizedBox(height: 300),
                      FormInputField(
                       controller: _myController,
                       hintText: "Enter School Code",
                      ),
                     
                      SizedBox(height: 40),

                      Padding(
                          padding: EdgeInsets.only(left: 120, right: 20),
                          child: TextButton(
                            onPressed: isLoading ? null : getData,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                              elevation: MaterialStateProperty.all(2.0),
                              padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 16),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                              ),
                            ),
                            child: Center(
                              child: isLoading
                                  ? SizedBox(
                                      width: 17,
                                      height: 17,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(
                                      "SUBMIT",
                                      style: TextStyle(color: Colors.white, fontFamily: "Varela", fontWeight: FontWeight.w600),
                                    ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}


