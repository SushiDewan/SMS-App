import 'package:flutter/material.dart';
import 'package:smsapp/CustomWidget/profileBox.dart';
import 'package:smsapp/CustomWidget/profileBox.dart';

class TeacherProfile extends StatefulWidget {
  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.save_outlined))
        ],
        title: Text("Profile",
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontFamily: "Varela",
                fontWeight: FontWeight.w600)),
      ),
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SingleChildScrollView(
          child: Column(
        children: [
         ProfileBox(
           title: "Name",
         ),
          ProfileBox(
           title: "Name",
         ),
          ProfileBox(
           title: "Name",
         )
         ],

         
      )),
    );
  }
}
