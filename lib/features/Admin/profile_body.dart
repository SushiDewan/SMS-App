import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smsapp/features/Admin/editProfile.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(children: [
        Stack(children: [
          Image.asset(
            "assets/images/schoolimage.jpg",
            width: double.infinity,
            height: 160,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: ClipRRect(
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/profile.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            ),
          ),
        ]),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          color: Colors.white,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "Name Name".toUpperCase(), // if user is admin then school name
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: "Varela",
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              Text(
                "Position".toUpperCase(),
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontFamily: "Varela",
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfile()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            color: Colors.white,
            width: double.infinity,
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1, color: Theme.of(context).accentColor))),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_callback_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: "Varela",
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "92384923758",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontFamily: "Varela",
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        Text(
                          "asf@gmail.com",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontFamily: "Varela",
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30, top: 30),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1, color: Theme.of(context).accentColor))),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Current Address",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: "Varela",
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Address Street Address",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontFamily: "Varela",
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30, top: 30),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1, color: Theme.of(context).accentColor))),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_callback_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EDN Number",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: "Varela",
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "92384923758",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontFamily: "Varela",
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
