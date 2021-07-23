import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:smsapp/CustomWidget/TextField.dart';
import 'package:smsapp/core/api/APIWithoutAuthentication.dart';
import 'package:smsapp/features/ForgotPassword/forget_password1_body.dart';

class ForgetPasswordBody extends StatefulWidget {
  @override
  _ForgetPasswordBodyState createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final _emailController = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  doReset() {
    print(_formKey.currentState.validate());
    if (!_formKey.currentState.validate()) return;
    setState(() {
      isLoading = true;
    });
    String email = _emailController.text;
    APIwithoutAuthentication api = APIwithoutAuthentication();
    api.post("api/reset_password/", jsonEncode({"email" : email}), (Response response) {
        setState(() {
          isLoading = false;
        });
        Map data = jsonDecode(response.body);
        print(response.body);
       Fluttertoast.showToast( msg: data['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: data['statusCode'] == 200 ? Colors.green : Colors.red,
          textColor: Colors.white,);
        if(data['statusCode'] == 200){
           Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword1Body()));
        }
      },
      (error) {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 0.9,
            fontFamily: "Varela",
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            Text(
              "Please enter Your registered Email ID/Phone",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Varela",
                  fontSize: 13),
            ),
            SizedBox(height: 20),
            Text(
              "We'll send a verification code to your registerd email Id/Phone",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontFamily: 'Varela',
                  fontSize: 12),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: FormInputField(
                icon: FontAwesomeIcons.userAlt,
                controller: _emailController,
                validator: (value) {
                  return (value == null || value == '')
                      ? 'Email cannot be empty'
                      : (!EmailValidator.validate(value))
                          ? "Enter valid email"
                          : null;
                },
                errorText: null,
                hintText: "Email/Phone",
              ),
            ),
            SizedBox(height: 70),
            Padding(
              padding: EdgeInsets.only(left: 120, right: 0),
              child: TextButton(
                onPressed: isLoading ? null : doReset,
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
                          "Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Varela",
                              fontWeight: FontWeight.w600),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
