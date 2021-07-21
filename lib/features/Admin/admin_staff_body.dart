import 'package:flutter/material.dart';

class AdminStaffBody extends StatefulWidget {
  @override
  _AdminStaffBodyState createState() => _AdminStaffBodyState();
}

class _AdminStaffBodyState extends State<AdminStaffBody>
    {
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              "Staff",
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 0.95,
                fontFamily: "Varela",
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          elevation: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
             
            ],
          ),
        ),
      ),
    );
  }
}
    
