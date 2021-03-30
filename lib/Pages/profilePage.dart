import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          child: Column(children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: HexColor("#B9E2DA")),
                  // decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //         begin: Alignment.topLeft,
                  //         end: Alignment.bottomRight,
                  //         colors: [HexColor("#FFCC00"),
                  //   HexColor("#F7A529")])),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 50.0),
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 30,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 110, bottom: 20),
                          child: Text("Profile",
                              style: TextStyle(
                                  fontSize: 25, color: Colors.white))),
                    ],
                  ),
                )),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 130.0),
                    child: ClipRRect(
                      child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/schoolimage.jpg"),
                                  fit: BoxFit.cover))),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1.0))),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 140),
                      child: Text("School Details"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 80.0),
                      child:
                          IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 250, top: 18),
                          child: Text(
                            "School Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            decoration: InputDecoration(hintText: "- - -"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 250, top: 18),
                          child: Text(
                            "School Address",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            decoration: InputDecoration(hintText: "- - -"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 250, top: 18),
                          child: Text(
                            "Email Address",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            decoration: InputDecoration(hintText: "- - -"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 250, top: 18),
                          child: Text(
                            "Phone Number",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            decoration: InputDecoration(hintText: "- - -"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 250, top: 18),
                          child: Text(
                            "School Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            decoration: InputDecoration(hintText: "- - -"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
            )
          ])),
    );
  }
}
