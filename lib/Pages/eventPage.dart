import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  bool value = false;
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text("Add Event")),
            content: Container(
                width: 300,
                height: 375,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Event Title",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 35,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "title",
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Event Title",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 35,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "title",
                        ),
                      ),
                    ),
                    Container(
                        child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text("Who Can see?")),
                        Container(
                            child: Column(
                          children: [
                            ListTile(
                                onTap: () {
                                  setState(() {
                                    this.value = !value;
                                  });
                                },
                                title: Text("Parent"),
                                leading: Checkbox(
                                  value: value,
                                  onChanged: (value) {
                                    setState(() {
                                      this.value = value;
                                    });
                                  },
                                )),
                            ListTile(
                                onTap: () {
                                  setState(() {
                                    this.value = !value;
                                  });
                                },
                                title: Text("Teacher"),
                                leading: Checkbox(
                                  value: value,
                                  onChanged: (value) {
                                    setState(() {
                                      this.value = value;
                                    });
                                  },
                                )),
                            ListTile(
                                onTap: () {
                                  setState(() {
                                    this.value = !value;
                                  });
                                },
                                title: Text("Sponsor"),
                                leading: Checkbox(
                                  value: value,
                                  onChanged: (value) {
                                    setState(() {
                                      this.value = value;
                                    });
                                  },
                                )),
                            ElevatedButton(
                                onPressed: () {}, child: Text("Submit"))
                          ],
                        ))
                      ],
                    ))
                  ],
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          color: HexColor("#B9E2DA")
                 ),
              height: 200,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 70.0),
                    child: IconButton(
                      color: HexColor("#ffffff"),
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40, left: 65),
                    child: RichText(
                      text: TextSpan(
                          text: "Manage",
                          style: TextStyle(
                              color: HexColor("#F7A529"),
                              fontWeight: FontWeight.w200,
                              fontSize: 24,
                              fontFamily: "Varela"),
                          children: [
                            TextSpan(
                                text: "Event",
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    color: HexColor("#F7A529")))
                          ]),
                    ),
                  ),
                ],
              ),
            )),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 200),
                child: ClipRRect(
                    child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 544,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // color: HexColor("#E6FEE8"),
                      // borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(30),
                      //     topRight: Radius.circular(30))
                          ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 60.0, left: 30, right: 30, bottom: 20),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: HexColor("#B9E2DA"),
                                    offset: Offset(0, 5))
                              ]),
                          child: ListTile(
                              title: Text(
                                "First Event",
                                style: TextStyle(
                                  fontFamily: "Varela",
                                  fontSize: 18,
                                    color: HexColor("#006658"),
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text("Tommorrow will be holiday",style: TextStyle(
                                  fontFamily: "Rubik",),
                              )),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 12.0, left: 30, right: 30),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: HexColor("#B9E2DA"),
                                    offset: Offset(0, 5))
                              ]),
                          child: ListTile(
                              title: Text("First Event"),
                              subtitle: Text("Tommorrow will be holiday")),
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),
          ],
        ),
      ])),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          backgroundColor: HexColor("#F7A529"),
          onPressed: () {
            createAlertDialog(context);
          },
          elevation: 10,
        ),
      ),
    );
  }
}
