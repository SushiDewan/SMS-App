import 'dart:convert';
import 'dart:ffi';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:smsapp/BLoc/UserInformation.dart';
import 'package:smsapp/core/api/APIWithoutAuthentication.dart';
import 'package:smsapp/features/Login/Widgets/TextField.dart';
import 'dart:math';
import 'package:path_provider/path_provider.dart';

import 'package:smsapp/features/Login/loginAdmin.dart';

class RegisterAdmin extends StatefulWidget {
  @override
  _RegisterAdminState createState() => _RegisterAdminState();
}

class _RegisterAdminState extends State<RegisterAdmin> {
  // final _formController = TextEditingController();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactController = TextEditingController();
  final _ednController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isVisiblePassword = false;
  String erroremail;
  String errorusername;
  String errorcontactnumber;
  String errorednnumber;

  bool isLoading = false;
  Future<void> deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();

    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }

  doSignUp() {
    setState(() {
      erroremail = null;
      errorusername = null;
      errorcontactnumber = null;
      errorednnumber = null;
    });
    deleteCacheDir();
    if (!_formKey.currentState.validate()) return;
    print("one");
    setState(() {
      isLoading = true;
    });
    String first_name = _firstNameController.text;
    String last_name = _lastNameController.text;
    String email = _emailController.text;
    String contact = _contactController.text;
    String address = _addressController.text;
    int role = 1;
    String edn_number = _ednController.text;
    String username = _usernameController.text;
    String password = _passwordController.text;

    APIwithoutAuthentication api = APIwithoutAuthentication();
    final SchoolBloc schoolBloc = BlocProvider.of<SchoolBloc>(context);
    api.post(
      "school/user/register/admin/",
      jsonEncode({
        "user": {
          "first_name": first_name,
          "last_name": last_name,
          "email": email,
          "contact_number": int.parse(contact, radix: 10),
          "address": address,
          "role": role,
          "edn_number": edn_number,
          "username": username,
          "password": password,
        },
        "school_id": schoolBloc.state.schoolCode,
      }),
      (Response response) {
        setState(() {
          isLoading = false;
        });
        print("response");
        print(response.body.toString());
        if (response.statusCode == 201) {
          Map result = jsonDecode(response.body);
          Fluttertoast.showToast(
            msg: result['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginAdmin()));
        } else if (response.statusCode == 400) {
          Map result = jsonDecode(response.body);
          setState(() {
            erroremail = result['user'].containsKey('email') ? result['user']['email'][0] : null;
            errorusername = result['user'].containsKey('username') ? result['user']['username'][0] : null;
            errorcontactnumber = result['user'].containsKey('contact_number') ? result['user']['contact_number'][0] : null;
            errorednnumber = result['user'].containsKey('edn_number') ? result['user']['edn_number'][0] : null;
          });
        }
      },
      (error) {
        setState(() {
          isLoading = false;
        });
        print(error);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Stack(children: [
                  Positioned(
                    top: -height * .18,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: Transform.rotate(
                      angle: -pi / 3.5,
                      child: ClipPath(
                        clipper: TopClipper(),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft, end: Alignment.centerRight, colors: [HexColor("#F7A529"), HexColor("#FFCC00")])),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                      ),
                    ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      foregroundColor: Colors.black,
                      title: Text("Register", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600, fontFamily: 'Varela')),
                    ),
                    body: Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.only(left: 40, right: 40),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 30),
                                      FormInputField(
                                        hintText: "First name",
                                        icon: Icons.face,
                                        controller: _firstNameController,
                                        validator: (value) {
                                          return (value == null || value == '') ? 'First name cannot be empty' : null;
                                        },
                                      ),
                                      SizedBox(height: 10),
                                      FormInputField(
                                        hintText: "Last name",
                                        icon: Icons.group,
                                        controller: _lastNameController,
                                        validator: (value) {
                                          return (value == null || value == '') ? 'Last name cannot be empty' : null;
                                        },
                                      ),
                                      SizedBox(height: 10),
                                      FormInputField(
                                        hintText: "Email",
                                        icon: FontAwesomeIcons.at,
                                        controller: _emailController,
                                        validator: (value) {
                                          return (value == null || value == '')
                                              ? 'Email cannot be empty'
                                              : (!EmailValidator.validate(value))
                                                  ? "Enter valid email"
                                                  : null;
                                        },
                                        errorText: erroremail,
                                      ),
                                      SizedBox(height: 10),
                                      FormInputField(
                                        hintText: "Username",
                                        icon: FontAwesomeIcons.userAlt,
                                        controller: _usernameController,
                                        validator: (value) {
                                          return (value == null || value == '') ? 'Username cannot be empty' : null;
                                        },
                                        errorText: errorusername,
                                      ),
                                      SizedBox(height: 10),
                                      FormInputField(
                                        hintText: "Address",
                                        icon: Icons.location_city,
                                        controller: _addressController,
                                        validator: (value) {
                                          return (value == null || value == '') ? 'Address cannot be empty' : null;
                                        },
                                      ),
                                      SizedBox(height: 10),
                                      FormInputField(
                                        hintText: "Contact number",
                                        icon: Icons.contact_phone,
                                        controller: _contactController,
                                        validator: (value) {
                                          return (value == null || value == '') ? 'Contact number cannot be empty' : null;
                                        },
                                        errorText: errorcontactnumber,
                                      ),
                                      SizedBox(height: 10),
                                      FormInputField(
                                        hintText: "EDN number",
                                        icon: Icons.format_list_numbered,
                                        controller: _ednController,
                                        validator: (value) {
                                          return (value == null || value == '') ? 'EDN number cannot be empty' : null;
                                        },
                                        errorText: errorednnumber,
                                      ),
                                      SizedBox(height: 10),
                                      FormInputField(
                                        hintText: "Password",
                                        icon: FontAwesomeIcons.lock,
                                        controller: _passwordController,
                                        validator: (value) {
                                          return (value == null || value == '') ? 'Password cannot be empty' : null;
                                        },
                                        obscureText: !isVisiblePassword,
                                        suffix: IconButton(
                                          iconSize: 18,
                                          icon: isVisiblePassword ? Icon(CupertinoIcons.eye_slash) : Icon(CupertinoIcons.eye),
                                          onPressed: () {
                                            setState(() {
                                              isVisiblePassword = !isVisiblePassword;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      FormInputField(
                                        hintText: "Re-enter password",
                                        icon: FontAwesomeIcons.lock,
                                        controller: null,
                                        validator: (value) {
                                          return (value != _passwordController.text) ? 'Password doesnot match ' : null;
                                        },
                                        obscureText: !isVisiblePassword,
                                        suffix: IconButton(
                                          iconSize: 18,
                                          icon: isVisiblePassword ? Icon(CupertinoIcons.eye_slash) : Icon(CupertinoIcons.eye),
                                          onPressed: () {
                                            setState(() {
                                              isVisiblePassword = !isVisiblePassword;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(left: 40, right: 40),
                              padding: EdgeInsets.only(left: 120, right: 10),
                              child: MaterialButton(
                                height: 50,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                disabledColor: HexColor('#B9E2DA'),
                                onPressed: isLoading ? null : doSignUp,
                                elevation: 10,
                                color: HexColor('#B9E2DA'),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "REGISTER",
                                      style: TextStyle(color: Colors.white, fontFamily: "Varela", fontWeight: FontWeight.w600),
                                    ),
                                    isLoading
                                        ? SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(),
                                          )
                                        : Icon(
                                            Icons.arrow_forward,
                                            size: 30,
                                            color: Colors.white,
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: TextButton(
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Already have an Account? ",
                                        style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Varela"),
                                        children: [
                                          TextSpan(
                                              text: "Login", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: HexColor('#F7A529')))
                                        ]),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginAdmin()));
                                  }),
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 120),
                ]),
              ),
            ],
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
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    /// [Left Middle]
    var fifthControlPoint = Offset(width * .3, height * .5);
    var fiftEndPoint = Offset(width * .23, height * .6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy, fiftEndPoint.dx, fiftEndPoint.dy);

    /// [Bottom Left corner]
    var thirdControlPoint = Offset(0, height);
    var thirdEndPoint = Offset(width, height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

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
