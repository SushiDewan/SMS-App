import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:smsapp/core/api/strings.dart';
import 'package:smsapp/core/widgets/build_button.dart';
import 'package:smsapp/core/widgets/build_text_form_field.dart';
import 'package:smsapp/features/LoginAdmin/presentation/bloc/admin_register_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:smsapp/features/Teacher/presentation/pages/teacher_login_page.dart';

class TeacherRegisterBody extends StatefulWidget {
  @override
  _TeacherRegisterBodyState createState() => _TeacherRegisterBodyState();
}

class _TeacherRegisterBodyState extends State<TeacherRegisterBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _address = TextEditingController();
  // TextEditingController _role = TextEditingController();
  TextEditingController _edn = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future submit() async {
    var api = Strings.RegisterAdmin_API_KEY;

    Map mappeddata = {
      "first_name": _firstname.text,
      "last_name": _lastname.text,
      "email": _email.text,
      "contact_number": _contact.text,
      "address": _address.text,
      "role": 1,
      "edn_number": _edn.text,
      "username": _username.text,
      "password": _password.text
    };

    print("JSONData: $mappeddata");
    http.Response response = await http.post(Uri.parse(api), body: mappeddata);
    print('Response status: ${response.statusCode}');
    var data = jsonDecode(response.body);
    print("data : $data");
    
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AdminRegisterBloc>(context, listen: false);
    final newFocus = FocusNode();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(newFocus);
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              HexColor('#F2B5FA'),
              HexColor('#EC8DAB'),
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text("Register",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Varela')),
          ),
          body: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    //firstName
                    StreamBuilder<Object>(
                        stream: bloc.firstname,
                        builder: (context, snapshot) {
                          return BuildTextFormField(
                            hintText: "FirstName",
                            keyboardType: TextInputType.name,
                            errorText: snapshot.error,
                            onChanged: bloc.changefirstname,
                          );
                        }),
                    SizedBox(height: 30),

                    //Lastname
                    StreamBuilder<Object>(
                        stream: bloc.lastname,
                        builder: (context, snapshot) {
                          return BuildTextFormField(
                              keyboardType: TextInputType.name,
                              hintText: "LastName",
                              errorText: snapshot.error,
                              onChanged: bloc.changelastname);
                        }),
                    SizedBox(height: 30),

                    //Email
                    StreamBuilder<Object>(
                        stream: bloc.email,
                        builder: (context, snapshot) {
                          return BuildTextFormField(
                              keyboardType: TextInputType.emailAddress,
                              hintText: "Email",
                              errorText: snapshot.error,
                              onChanged: bloc.changeemail);
                        }),
                    SizedBox(height: 30),

                    //Contact num
                    StreamBuilder<Object>(
                        stream: bloc.contactnum,
                        builder: (context, snapshot) {
                          return BuildTextFormField(
                              hintText: "Contact Number",
                              keyboardType: TextInputType.phone,
                              errorText: snapshot.error,
                              onChanged: bloc.changecontactnum);
                        }),
                    SizedBox(height: 30),

                    //Address
                    StreamBuilder<Object>(
                        stream: bloc.address,
                        builder: (context, snapshot) {
                          return BuildTextFormField(
                              hintText: "Address",
                              keyboardType: TextInputType.text,
                              errorText: snapshot.error,
                              onChanged: bloc.changeaddress);
                        }),
                    SizedBox(height: 30),

                    StreamBuilder<Object>(
                        stream: bloc.edn,
                        builder: (context, snapshot) {
                          return BuildTextFormField(
                              hintText: "EDN Number",
                              keyboardType: TextInputType.number,
                              errorText: snapshot.error,
                              onChanged: bloc.changeedn);
                        }),
                    SizedBox(height: 30),

                    //username
                    StreamBuilder<Object>(
                        stream: bloc.username,
                        builder: (context, snapshot) {
                          return BuildTextFormField(
                              hintText: "Username",
                              errorText: snapshot.error,
                              onChanged: bloc.changeusername);
                        }),
                    SizedBox(height: 30),

                    //password
                    StreamBuilder<Object>(
                        stream: bloc.password,
                        builder: (context, snapshot) {
                          return BuildTextFormField(
                              hintText: "Password",
                              errorText: snapshot.error,
                              onChanged: bloc.changepassword);
                        }),
                    SizedBox(height: 30),

                    //Register button
                    StreamBuilder<Object>(
                        stream: bloc.isValid,
                        builder: (context, snapshot) {
                          return BuildButton(
                              color: snapshot.hasError || !snapshot.hasData
                                  ? Colors.red
                                  : Colors.green,
                              title: "Register",
                              onTap: snapshot.hasError || !snapshot.hasData
                                  ? null
                                  : () {
                                      submit();
                                    });
                        }),

                    SizedBox(height: 10),
                    Container(
                      child: TextButton(
                          child: RichText(
                            text: TextSpan(
                                text: "Already have an Account? ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: "Varela"),
                                children: [
                                  TextSpan(
                                      text: "Login",
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
                                    builder: (context) => TeacherLoginPage()));
                          }),
                    )
                  ]),
                )),
          ),
        ),
      ),
    );
  }
}
