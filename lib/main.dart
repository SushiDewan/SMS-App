import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:smsapp/features/SchoolCode/presentation/pages/school_code_page.dart';

// import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: new ThemeData(

        backgroundColor: Colors.red,
        textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 20
            )
        ),
        ),
      home: Home(),
      debugShowCheckedModeBanner: false,
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
    controller = AnimationController(
        duration: const Duration(milliseconds: 4000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: BoxDecoration(
            color: Colors.red
              // gradient: LinearGradient(
              //     begin: Alignment.bottomLeft,
              //     end: Alignment.topRight,
              //     colors: [
              //   HexColor("#95429C").withOpacity(0.8),
              //   HexColor('#A93E68'),
              //   HexColor("#BB3A35").withOpacity(0.9)
              // ])
              ),
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(top: 250),
                child: Center(
                  child: Column(
                    children: [
                      FadeTransition(
                        opacity: animation,
                        child: Icon(
                          FontAwesomeIcons.bookOpen,
                          size: 130,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "School",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Varela",
                            color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Management System",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Varela",
                            color: Colors.white),
                      ),
                    ],
                  ),
                )),
            Padding(padding: EdgeInsets.only(top: 200.0), child: Indicator())
          ])),
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
    Timer(
        Duration(milliseconds: 4000),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SchoolCodePage())));
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.white.withOpacity(0.5),
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
