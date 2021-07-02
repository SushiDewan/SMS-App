import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:smsapp/core/widgets/build_button.dart';
import 'package:smsapp/core/widgets/build_text_form_field.dart';
import 'package:smsapp/features/Teacher/presentation/bloc/teacher_login_bloc.dart';
import 'package:smsapp/features/Teacher/presentation/pages/teacher_dashboard_page.dart';
import 'package:smsapp/features/Teacher/presentation/pages/teacher_forgetpwd_page.dart';
import 'package:smsapp/features/Teacher/presentation/widgets/teacher_register_body.dart';

class TeacherLoginBody extends StatefulWidget {
  @override
  _TeacherLoginBodyState createState() => _TeacherLoginBodyState();
}

class _TeacherLoginBodyState extends State<TeacherLoginBody> {
  var newFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TeacherLoginBloc>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            HexColor('#F2B5FA'),
            HexColor('#EC8DAB'),
          ])),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
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
                      style: TextStyle(
                          fontSize: 60, fontWeight: FontWeight.w600))),
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
                      stream: bloc.teacherUsername,
                      builder: (context, AsyncSnapshot snapshot) =>
                          BuildTextFormField(
                            hintText: "Username",
                            errorText: snapshot.error,
                            onChanged: bloc.changeteacherUsername,
                          )),
                  SizedBox(height: 30),
                  StreamBuilder<Object>(
                      stream: bloc.teacherPassword,
                      builder: (context, AsyncSnapshot snapshot) {
                        return BuildTextFormField(
                          hintText: "Password",
                          errorText: snapshot.error,
                          onChanged: bloc.changeteacherPassword,
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
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TeacherDashboardPage()));
                                        }

                              
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
                                          TeacherForgetPwdPage()));
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
                                builder: (context) => TeacherRegisterBody()));
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
