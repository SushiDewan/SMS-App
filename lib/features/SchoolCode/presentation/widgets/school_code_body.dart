import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smsapp/core/widgets/build_button.dart';
import 'package:smsapp/core/widgets/build_text_form_field.dart';
import 'package:smsapp/features/Card/presentation/pages/choose_user_page.dart';

class SchoolCodeBody extends StatefulWidget {
  @override
  _SchoolCodeBodyState createState() => _SchoolCodeBodyState();
}

class _SchoolCodeBodyState extends State<SchoolCodeBody> {
  final id = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Stack(alignment: AlignmentDirectional.topCenter, children: [
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
                    colors: [HexColor("#F7A529"), HexColor("#FFCC00")]),
              ),
              height: MediaQuery.of(context).size.height / 2.5,
            ),
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Column(
                children: [
                  SizedBox(height: 260),
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
            "School Code",
            style: TextStyle(
                fontSize: 22,
                fontFamily: 'Varela',
                fontWeight: FontWeight.w600,
                color: Colors.black),
                        ),
                      )),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: BuildTextFormField(keyboardType: TextInputType.number, controller: id, )
                  ),
                  SizedBox(height: 40),
                  BuildButton(
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 400),
            pageBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation) {
              print(id.text);
              return ChooseUserPage(id: id.text);
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
                    title: "submit",
                  )
                ],
              ),
          )
        ]));
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move from bottom right to top
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
