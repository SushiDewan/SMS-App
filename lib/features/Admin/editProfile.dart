import 'package:flutter/material.dart';
import 'package:smsapp/CustomWidget/profileBox.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
           title: "Username",
         ),
          ProfileBox(
           title: "Father's Name",
         ),
          ProfileBox(
           title: "Mother's Name",
         ),
         
          ProfileBox(
           title: "EDN Number",
         ),
         
          ProfileBox(
           title: "Email-id",
         ),
          ProfileBox(
           title: "Contact Number",
         ),
          ProfileBox(
           title: "Address",
         ),
         
         ],

         
      )),
    );
  }
}
