import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smsapp/BLoc/UserInformation.dart';
import 'package:smsapp/features/Admin/presentation/pages/admin_dashboard_page.dart';
import 'dart:async';
import 'package:smsapp/features/SchoolCode/presentation/pages/school_code_page.dart';

// import 'package:animated_splash_screen/animated_splash_screen.dart';

class SchoolBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> main() async {
  Bloc.observer = SchoolBlocObserver();
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
              backgroundColor: Colors.red,
              textTheme: TextTheme(headline1: TextStyle(fontSize: 20)),
            ),
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
      body: Container(
        decoration: BoxDecoration(color: Colors.red),
        child: Column(
          children: [
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
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "School",
                        style: TextStyle(fontSize: 25, fontFamily: "Varela", color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Management System",
                        style: TextStyle(fontSize: 20, fontFamily: "Varela", color: Colors.white),
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
      Timer(Duration(milliseconds: 4000), () => Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboardPage())));
    } else
      Timer(Duration(milliseconds: 4000), () => Navigator.push(context, MaterialPageRoute(builder: (context) => SchoolCodePage())));
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.white.withOpacity(0.5),
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
