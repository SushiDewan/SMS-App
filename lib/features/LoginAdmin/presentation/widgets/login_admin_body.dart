import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:smsapp/core/widgets/build_button.dart';
import 'package:smsapp/core/widgets/build_text_form_field.dart';
import 'package:smsapp/features/ForgotPassword/presentation/pages/forget_password_page.dart';
import 'package:smsapp/features/LoginAdmin/presentation/bloc/admin_login_bloc.dart';
import 'package:smsapp/features/LoginAdmin/presentation/widgets/register_admin_body.dart';

class LoginAdminBody extends StatefulWidget {
  @override
  _LoginAdminBodyState createState() => _LoginAdminBodyState();
}

class _LoginAdminBodyState extends State<LoginAdminBody> {
  var newFocus = FocusNode();


  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AdminLoginBloc>(context, listen: false);

    return Container(   
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            HexColor('#F2B5FA'),
            HexColor('#EC8DAB'),
          ])
          ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          FocusScope.of(context).requestFocus(newFocus);
        },
              child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Column(
              children: [],
            ),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 40),
              Center(
                  child: Text("Hello!",
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.w600))),
              // SizedBox(height:10),
              Center(
                  child: Text(
                "Sign in to your account",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              )),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: HexColor('#F2B5FA'),
                  boxShadow: [
                    BoxShadow(
                        color: HexColor('#F2B5FA').withOpacity(0.2),
                        offset: Offset(0, 10),
                        blurRadius: 20)
                  ],
                ),
                child: Column(children: [
                  StreamBuilder<Object>(
                      stream: bloc.loginUsername,
                      builder: (context, AsyncSnapshot snapshot) =>
                          BuildTextFormField(
                            hintText: "Username",
                            errorText: snapshot.error,
                            onChanged: bloc.changeloginUsername,
                          )),
                  SizedBox(height: 30),
                  StreamBuilder<Object>(
                      stream: bloc.loginPassword,
                      builder: (context, AsyncSnapshot snapshot) {
                        return BuildTextFormField(
                          hintText: "Password",
                          errorText: snapshot.error,
                          onChanged: bloc.changeloginPassword,
                        );
                      }),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StreamBuilder<Object>(
                            stream: bloc.isValid,
                            builder: (context, AsyncSnapshot snapshot) {
                              return BuildButton(
                                  color: snapshot.hasError || !snapshot.hasData
                                      ? Colors.red
                                      : Colors.green,
                                  title: "Login",
                                  onTap: snapshot.hasError || !snapshot.hasData
                                      ? null
                                      : () {
                                          bloc.submit();
                                        }

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => AdminDashboardPage()));

                                  );
                            }),
                        TextButton(
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: "Varela"),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgetPasswordPage()));
                            }),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                      child: RichText(
                        text: TextSpan(
                            text: "Haven't registered Yet? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Varela"),
                            children: [
                              TextSpan(
                                  text: "Register",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ))
                            ]),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterAdminBody()));
                      }),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = new Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, height);
    path.lineTo(size.width, 0);

    /// [Top Left corner]
    var secondControlPoint = Offset(0, 0);
    var secondEndPoint = Offset(width * .2, height * .3);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    /// [Left Middle]
    var fifthControlPoint = Offset(width * .3, height * .5);
    var fiftEndPoint = Offset(width * .23, height * .6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fiftEndPoint.dx, fiftEndPoint.dy);

    /// [Bottom Left corner]
    var thirdControlPoint = Offset(0, height);
    var thirdEndPoint = Offset(width, height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// class FirstClipper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//     // This is where we decide what part of our image is going to be visible.
//     var path = Path();
//   //   path.lineTo(0.0, size.height-180);
//   //  var firstControlPoint = new Offset(size.width / 5, size.height -140);
//   // var firstEndPoint = new Offset(size.width / 3, size.height /6);

//   //   path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//   //       firstEndPoint.dx, firstEndPoint.dy);

//   //   var secondControlPoint = Offset(size.width/4, size.height /6);
//   //   var secondEndPoint = Offset(size.width /2, size.height );
//   //   path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//   //       secondEndPoint.dx, secondEndPoint.dy);

//     // var thirdControlPoint =
//     //     Offset(size.width - (size.width / 9), size.height / 6);
//     // var thirdEndPoint = Offset(size.width, 0.0);
//     // path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
//     //     thirdEndPoint.dx, thirdEndPoint.dy);

//     ///move from bottom right to top
//     path.lineTo(size.width/1.8, 0.0);

//     ///finally close the path by reaching start point from top right corner
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
