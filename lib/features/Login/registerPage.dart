import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:smsapp/BLoc/UserInformation.dart';
import 'package:smsapp/core/api/APIWithoutAuthentication.dart';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:smsapp/CustomWidget/TextField.dart';
import 'package:smsapp/features/Login/loginPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
  String role = "1";
  String staffType = "1";

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
    int role1 = int.parse(role);
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
          "role": role1,
          "staff_type": staffType,
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
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        } else if (response.statusCode == 400) {
          Map result = jsonDecode(response.body);
          setState(() {
            erroremail = result['user'].containsKey('email')
                ? result['user']['email'][0]
                : null;
            errorusername = result['user'].containsKey('username')
                ? result['user']['username'][0]
                : null;
            errorcontactnumber = result['user'].containsKey('contact_number')
                ? result['user']['contact_number'][0]
                : null;
            errorednnumber = result['user'].containsKey('edn_number')
                ? result['user']['edn_number'][0]
                : null;
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
                                  begin: Alignment.topLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                Theme.of(context).primaryColor,
                                Theme.of(context).accentColor
                              ])),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                      ),
                    ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      iconTheme: IconThemeData(color: Colors.black),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Text("Register",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Varela')),
                    ),
                    body: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(height: 30),
                                    FormInputField(
                                      hintText: "First name",
                                      icon: Icons.face,
                                      controller: _firstNameController,
                                      validator: (value) {
                                        return (value == null || value == '')
                                            ? 'First name cannot be empty'
                                            : null;
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    FormInputField(
                                      hintText: "Last name",
                                      icon: Icons.group,
                                      controller: _lastNameController,
                                      validator: (value) {
                                        return (value == null || value == '')
                                            ? 'Last name cannot be empty'
                                            : null;
                                      },
                                    ),
                                    SizedBox(height: 20),
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
                                    SizedBox(height: 20),
                                    FormInputField(
                                      hintText: "Username",
                                      icon: FontAwesomeIcons.userAlt,
                                      controller: _usernameController,
                                      validator: (value) {
                                        return (value == null || value == '')
                                            ? 'Username cannot be empty'
                                            : null;
                                      },
                                      errorText: errorusername,
                                    ),
                                    SizedBox(height: 20),
                                    FormInputField(
                                      hintText: "Address",
                                      icon: Icons.location_city,
                                      controller: _addressController,
                                      validator: (value) {
                                        return (value == null || value == '')
                                            ? 'Address cannot be empty'
                                            : null;
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    FormInputField(
                                      hintText: "Contact number",
                                      icon: Icons.contact_phone,
                                      controller: _contactController,
                                      validator: (value) {
                                        return (value == null || value == '')
                                            ? 'Contact number cannot be empty'
                                            : null;
                                      },
                                      errorText: errorcontactnumber,
                                    ),
                                    SizedBox(height: 20),
                                    FormInputField(
                                      hintText: "EDN number",
                                      icon: Icons.format_list_numbered,
                                      controller: _ednController,
                                      validator: (value) {
                                        return (value == null || value == '')
                                            ? 'EDN number cannot be empty'
                                            : null;
                                      },
                                      errorText: errorednnumber,
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text("You are?"),
                                        Spacer(),
                                        DropdownButton<String>(
                                          items: <Map>[
                                            {"name": "Admin", "value": 1},
                                            {"name": "Staff", "value": 2},
                                            {"name": "Parent", "value": 3},
                                            {"name": "Sponser", "value": 4},
                                            {"name": "Student", "value": 5},
                                          ].map((Map value) {
                                            return DropdownMenuItem<String>(
                                              value: value['value'].toString(),
                                              child: new Text(value['name']),
                                            );
                                          }).toList(),
                                          value: role,
                                          onChanged: (value) {
                                            setState(() {
                                              role = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    (role == "2")
                                        ? Row(
                                            children: [
                                              Text("Please select staff type"),
                                              Spacer(),
                                              DropdownButton<String>(
                                                items: <Map>[
                                                  {
                                                    "name": "Teaching",
                                                    "value": 1
                                                  },
                                                  {
                                                    "name": "Non-Teaching",
                                                    "value": 2
                                                  },
                                                ].map((Map value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value['value']
                                                        .toString(),
                                                    child:
                                                        new Text(value['name']),
                                                  );
                                                }).toList(),
                                                value: staffType,
                                                onChanged: (value) {
                                                  setState(() {
                                                    staffType = value;
                                                  });
                                                },
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    SizedBox(height: 20),
                                    FormInputField(
                                      hintText: "Password",
                                      icon: FontAwesomeIcons.lock,
                                      controller: _passwordController,
                                      validator: (value) {
                                        return (value == null || value == '')
                                            ? 'Password cannot be empty'
                                            : null;
                                      },
                                      obscureText: !isVisiblePassword,
                                      suffix: isVisiblePassword
                                          ? CupertinoIcons.eye_slash
                                          : CupertinoIcons.eye,
                                      onSuffixPressed: () {
                                        setState(() {
                                          isVisiblePassword =
                                              !isVisiblePassword;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    FormInputField(
                                      hintText: "Re-enter password",
                                      icon: FontAwesomeIcons.lock,
                                      controller: null,
                                      validator: (value) {
                                        return (value !=
                                                _passwordController.text)
                                            ? 'Password doesnot match '
                                            : null;
                                      },
                                      obscureText: !isVisiblePassword,
                                      suffix: isVisiblePassword
                                          ? CupertinoIcons.eye_slash
                                          : CupertinoIcons.eye,
                                      onSuffixPressed: () {
                                        setState(() {
                                          isVisiblePassword =
                                              !isVisiblePassword;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 120, right: 0),
                              child: TextButton(
                                onPressed: isLoading ? null : doSignUp,
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
                                          "Register",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Varela",
                                              fontWeight: FontWeight.w600),
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: InkWell(
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Already have an Account? ",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: 14,
                                            fontFamily: "Varela"),
                                        children: [
                                          TextSpan(
                                              text: "Login",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "Varela",
                                                  fontWeight: FontWeight.w600,
                                                  color: Theme.of(context)
                                                      .primaryColor))
                                        ]),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
