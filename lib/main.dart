import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smsapp/BLoc/UserInformation.dart';
import 'package:smsapp/features/Admin/dashboard_body.dart';
import 'dart:async';
import 'package:smsapp/features/SchoolCode/school_code_body.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SchoolBloc(),
      child: BlocBuilder<SchoolBloc, UserInformation>(
        builder: (_, theme) {
          return MaterialApp(
            theme: new ThemeData(
              primaryColor: Colors.deepPurple,
              accentColor: Colors.deepPurpleAccent,
              backgroundColor: Colors.white,
              inputDecorationTheme: InputDecorationTheme(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.2,
                    color: Colors.deepPurple,
                  ),
                ),
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.deepPurple,
                ),
                contentPadding: EdgeInsets.all(10),
                suffixStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.deepPurple,
                ),
              ),
              buttonTheme: ButtonThemeData(),
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  elevation: MaterialStateProperty.all(2.0),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 16),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                  textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white, fontFamily: "Varela", fontWeight: FontWeight.w600)),
                ),
              ),
              textTheme: TextTheme(headline1: TextStyle(fontSize: 20)),
            ),
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 4000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 250),
                child: Center(
                  child: Column(
                    children: [
                      FadeTransition(
                          opacity: animation,
                          child: Image.asset(
                            "assets/images/book.png",
                            height: 120,
                          )),
                      SizedBox(height: 25),
                      Text(
                        "SMEGP",
                        style: TextStyle(fontSize: 30, fontFamily: "Varela", color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "School Management System",
                        style: TextStyle(fontSize: 12, fontFamily: "Varela", color: Colors.white),
                      ),
                    ],
                  ),
                )),
            Padding(padding: EdgeInsets.only(top: 200.0), child: Indicator())
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatefulWidget {
  @override
  _IndicatorState createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  void initState() {
    super.initState();
    navigationIfSeesionExist();
  }

  navigationIfSeesionExist() async {
    if (await context.read<SchoolBloc>().isLogin()) {
      Timer(Duration(milliseconds: 4000), () => Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboardBody())));
    } else
      Timer(Duration(milliseconds: 4000), () => Navigator.push(context, MaterialPageRoute(builder: (context) => SchoolCodeBody())));
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.white.withOpacity(0.5),
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
